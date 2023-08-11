$project_name  = "vagrant-bolt-mysql"
$virtualbox_os = "ubuntu/focal64"
$msg = <<MSG
------------------------------------------------------

bolt module install --force
./runme.sh

------------------------------------------------------
MSG

require 'vagrant-bolt'
vagrant_root = File.dirname(__FILE__)

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
      v.name = $project_name
  end

  config.vm.box = $virtualbox_os
  config.vm.hostname = $project_name
  config.vm.post_up_message = $msg
  config.bolt.verbose = true
  config.bolt.debug   = true

  config.trigger.after :up do |trigger|
    trigger.name = "Bolt \"facts::bash\" after :up"
    trigger.ruby do |env, machine|
      VagrantBolt.plan("facts", env, machine)
    end
  end

  config.vm.provision :bolt do |bolt|
    #bolt.project = './src'
    bolt.command = :plan
    bolt.name = $project_name
    bolt.run_as = "root"
  end

#    DEBIAN_FRONTEND=noninteractive apt-get -fy --no-install-suggests --no-install-recommends  install \
#    chrony git-core dnsutils vim dirmngr apt-transport-https cpanminus curl wget lsb-release \
#    libc6-dev gcc make rsync net-tools xfonts-utils fontconfig jq -fy
end

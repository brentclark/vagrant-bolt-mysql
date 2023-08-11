#!/bin/bash
#
#
#
bolt task run puppet_agent::install -t linux --run-as root

#
bolt plan run vagrant_bolt_mysql::init \
  --clear-cache \
  --run-as root \
  -t linux

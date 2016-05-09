#
# Cookbook Name:: awesome_customers_delivery
# Recipe:: firewall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'firewall::default'

ports = node.default['Sample_ruby_project']['open_ports']
firewall_rule "open ports #{ports}" do
  port ports
end

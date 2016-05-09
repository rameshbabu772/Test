#
# Cookbook Name:: sinatra
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group node['sinatra']['group']

user node['sinatra']['user'] do
  group node['sinatra']['group']
  system true
  shell '/bin/bash'
end

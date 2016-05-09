# define tag
tag("sinatra-server")

node.default['nginx']['worker_processes'] = 4
node.default['nginx']['user']  = 'nobody'
node.default['nginx']['group'] = 'nogroup'
node.default['nginx']['worker_connections'] = 1024
node.default['nginx']['gzip'] = 'on'
node.default['nginx']['gzip_vary'] = 'on'
node.default['nginx']['gzip_min_length'] = 500
node.default['nginx']['gzip_disable'] = 'MSIE [1-6]\.(?!.*SV1)'
node.default['nginx']['gzip_types'] = [
    'text/plain',
    'text/xml',
    'text/css',
    'text/comma-separated-values',
    'text/javascript',
    'application/x-javascript',
    'application/atom+xml',
    'image/x-icon'
  ]
node.default['nginx']['default_site_enabled'] = false
include_recipe 'nginx::default'
include_recipe 'unicorn::default'

gem_package "sinatra" do
  action :install
  version "#{node["sinatra"]["version"]}"
end

gem_package 'sinatra-contrib' do
  action :install
  version '>0'
end

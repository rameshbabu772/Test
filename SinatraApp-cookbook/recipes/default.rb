include_recipe 'apt'
package 'ruby-dev'

include_recipe 'sinatra::install'
include_recipe 'sinatra::configure'
include_recipe 'sinatra::package_cache'
include_recipe 'sinatra::firewall'
include_recipe 'sinatra::user'
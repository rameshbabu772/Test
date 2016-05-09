include_recipe 'apt'
package 'ruby-dev'

include_recipe 'sinatra::install'
include_recipe 'sinatra::configure'
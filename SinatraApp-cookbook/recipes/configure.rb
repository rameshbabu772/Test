#######################
## Configure Sinatra ##
#######################
directory "#{node['sinatra']['app_root']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['sinatra']['app_root']}/public" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['sinatra']['app_root']}/tmp" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['sinatra']['app_root']}/tmp/sockets" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['sinatra']['app_root']}/tmp/pids" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['sinatra']['app_root']}/log" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "/etc/nginx/sites-available/sinatra" do
  mode 00644
  source "sinatra.erb"
  variables(
    :app_root => node['sinatra']['app_root']
  )
end

template "#{node['sinatra']['app_root']}/unicorn.rb" do
  mode 00755
  source "unicorn.rb.erb"
  variables(
    :app_root => node['sinatra']['app_root']
  )
end

cookbook_file "/etc/init.d/unicorn" do
  source 'unicorn'
  mode '0755'
  owner 'root'
  group 'root'
end

cookbook_file "#{node['sinatra']['app_root']}/index.rb" do
  source 'index.rb'
  mode '0755'
  owner 'root'
  group 'root'
end

cookbook_file "#{node['sinatra']['app_root']}/config.ru" do
  source 'config.ru'
  mode '0644'
  owner 'root'
  group 'root'
end

nginx_site 'sinatra' do
  enable true
end

service 'unicorn' do
  action :restart
end

service "nginx" do
  action :restart
end
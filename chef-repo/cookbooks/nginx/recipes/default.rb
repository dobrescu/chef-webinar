#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'nginx' do
  version node['nginx']['version']
  action :install
end

service 'nginx' do
  action :stop
end

template '/etc/nginx/sites-available/default' do
  source 'default.erb'
  variables(node['nginx']['servers'])
end

service 'nginx' do
  action [:enable, :start]
end

#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.



include_recipe 'first_cookbook::bogus'


node.default['first_cookbook']['index_path_location'] = '/var/www/html/index.html'

package 'apache2' do
  action :install
  only_if {node['platform'] == 'ubuntu' }
end

package 'httpd' do
  action :install
  only_if {node['platform'] == 'centos' }
end



package 'default-jre' do
  only_if {node['platform'] == 'ubuntu' }
end


template node['first_cookbook']['index_path_location'] do
  source 'index.html.erb'
  variables ({
 my_ipaddress: node['ipaddress'],
 my_hostname: node['hostname'],
 my_total_memory: node['memory']['total']
    })
end

remote_file '/var/www/html/success.html' do
  only_if {node['platform'] == 'ubuntu' }
  source 'https://raw.githubusercontent.com/dobrescu/chef-webinar/master/standalone/success.html'
  action :create
end


service 'apache2' do
  only_if {node['platform'] == 'ubuntu' }
  action [:enable, :start]
end

service 'httpd' do
  only_if {node['platform'] == 'centos' }
  action [:enable, :start]
end

#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


package 'apache2'

package 'default-jre'

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables ({
 my_ipaddress: node['ipaddress'],
 my_hostname: node['hostname'],
 my_total_memory: node['memory']['total']
    })
end

remote_file '/var/www/html/success.html' do
  source 'https://raw.githubusercontent.com/dobrescu/chef-webinar/master/standalone/success.html'
  action :create
end

execute 'display_java_version' do
  command 'java -version'
  live_stream true
end

service 'apache2' do
  action [:enable, :start]
end

#
# Cookbook:: test_cookbook
# Recipe:: test
#
# Copyright:: 2018, The Authors, All Rights Reserved.




template '/var/www/html/index.html' do
   source 'index.html.erb'
   action :create
   variables({name: node['hostname'], ipaddress: node['ipaddress']})
end

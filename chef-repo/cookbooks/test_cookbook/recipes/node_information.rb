#
# Cookbook:: test_cookbook
# Recipe:: node_information
#
# Copyright:: 2018, The Authors, All Rights Reserved.

file '/media/sf_chef-webinar/chef-repo/node_information' do
  content node['packages']['apache2']['version']
  action :create
end

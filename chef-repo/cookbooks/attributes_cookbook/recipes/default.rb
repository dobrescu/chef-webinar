#
# Cookbook:: attributes_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['attributes_cookbook']['file_path'] = '/Users/dobrescu/workspace/personal/chef-webinar/chef-repo/test_file_from_recipe'

file '/Users/dobrescu/workspace/personal/chef-webinar/chef-repo/test_file_from_recipe' do
  content node['hostname']
end



user 'jake' do
  action :create
end
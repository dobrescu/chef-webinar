#
# Cookbook:: second_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


user 'demo' do
 action :remove
end

directory '/home/demo/' do
  recursive true
  action :delete
end

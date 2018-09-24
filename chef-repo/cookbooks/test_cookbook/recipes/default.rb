#
# Cookbook:: test_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'daily' do
  frequency 86400
  action    :periodic
end

package 'apache2' do
  version '2.4.29-1ubuntu4.3'
  action :install
end

include_recipe 'test_cookbook::test'

service "apache2" do
  action [:enable, :start]
end


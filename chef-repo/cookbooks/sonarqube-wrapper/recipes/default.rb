#
# Cookbook:: sonarqube-wrapper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java'
include_recipe 'sonarqube'


service 'sonarqube' do
  action [:enable, :start]
end
#
# Cookbook:: mysql-wrapper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


mysql_service 'foo' do
  port '3306'
  version '5.7'
  bind_address '0.0.0.0'
  initial_root_password 'root'
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  gem_version '0.4.5'
  package_version '5.7'
  action :install
end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => 'root'
}

mysql_database 'sonarqube' do
  connection mysql_connection_info
  action :create
end

database_user 'sonarqube' do
  connection mysql_connection_info
  password   'sonarqube'
  host       '%'
  provider   Chef::Provider::Database::MysqlUser
  privileges    [:all]
  action     :create
end
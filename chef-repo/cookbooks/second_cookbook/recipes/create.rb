#
# Cookbook:: second_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


user 'demo' do
 shell '/bin/bash'
 home '/home/demo'
 manage_home true
 password '$1$lp.rXoHJ$aNVdA5QjLCtj2Oo8VGq.h.'
end

directory '/home/demo/folder1/folder2/folder3' do
  recursive true
  mode 0777
  user 'root'
  group 'root'
end

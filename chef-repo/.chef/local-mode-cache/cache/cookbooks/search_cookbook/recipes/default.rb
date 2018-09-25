#
# Cookbook:: search_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


search("nodes", "platform:ubuntu 18.04").each do |dev|

file '/Users/dobrescu/workspace/personal/chef-webinar/chef-repo/' do
  content dev
end

end
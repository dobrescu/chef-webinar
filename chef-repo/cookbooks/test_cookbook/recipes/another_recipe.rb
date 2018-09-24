file '/media/sf_chef-webinar/chef-repo/test_file' do
  content 'something'
  action :create
end

file '/media/sf_chef-webinar/chef-repo/another_test_file' do
  content 'something else'
  action :create
  only_if {::File.exists?("/media/sf_chef-webinar/chef-repo/test_file") }
end

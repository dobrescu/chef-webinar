package 'apache2' do 
   version '2.4.29-1ubuntu4.3'
   action :install
end

service 'apache2' do
   action [:enable, :start]
end

file '/var/www/html/index.html' do
   content "<html>
<body>
<h1>
Hello World running on #{node['environment']}
</h1>
</body>
</html>"
end

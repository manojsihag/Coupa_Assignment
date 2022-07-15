#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'vim'

package 'apache2' do
  action :install
end

package 'php'

file 'var/www/html/index.html' do
  content "<h1>Hello, world!<h1>
  IPADDRESS: #{node['ipaddress']}
  HOSTNAME: #{node['hostname']}"
  mode '0755'
end

service 'apache2' do
  action [:enable,:start ]
end


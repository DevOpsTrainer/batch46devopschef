#
# Cookbook:: batch46apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package "git" do
	action :install
end

package "tree" do
	action :install
end

package "httpd" do
	action :install
end

service "httpd" do
	action [:enable, :start]
end

file '/var/www/html/index.html' do
	content 'Hello Chef Configuration Managment batch46 change'
	mode '0775'
	owner 'root'
	group 'apache'
	notifies :restart, "service[httpd]"
end

file '/etc/httpd/conf.d/welcome.conf' do
	action :delete
	 notifies :restart, "service[httpd]"
end

template "/tmp/server.xml" do
	source "apache_dev.erb"
	mode "0775"
	owner "root"
	group "apache"
end

execute "/usr/bin/rm /tmp/tomcat.xml" do
	only_if do
	 File.exist?("/tmp/tomcat.xml")
	end
end

package "php" do
	action :install
end

cookbook_file "/etc/php.ini" do
	source "php.ini"
	mode "0644"
end

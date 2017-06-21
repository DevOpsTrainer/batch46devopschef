#
# Cookbook Name:: batch46
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
file '/tmp/hello.txt' do 
	action :delete
end

file '/tmp/hello_new.txt' do
	 action :delete
end

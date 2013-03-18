#
# Cookbook Name:: database
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_connection_info = {
  :host     => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database_user 'rails' do
  connection mysql_connection_info
  password ''
  action :create
end

mysql_database_user 'rails' do
  connection mysql_connection_info
  password ''
  database_name 'activerecord_unittest'
  host 'localhost'
  privileges [:all]
  action :grant
end

mysql_database_user 'rails' do
  connection mysql_connection_info
  password ''
  database_name 'activerecord_unittest2'
  host 'localhost'
  privileges [:all]
  action :grant
end

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

databases = %w(activerecord_unittest activerecord_unittest2)

databases.each do |database|
  mysql_database database do
    connection mysql_connection_info
    action :create
  end
end

mysql_database_user 'rails' do
  connection mysql_connection_info
  password ''
  action :create
end

databases.each do |database|
  mysql_database_user 'rails' do
    connection mysql_connection_info
    password ''
    database_name database
    host 'localhost'
    privileges [:all]
    action :grant
  end
end

#
# Cookbook Name:: database
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

databases = %w(activerecord_unittest activerecord_unittest2)

# mysql

mysql_connection_info = {
  :host     => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

databases.each do |database|
  mysql_database database do
    connection mysql_connection_info
    encoding "utf8"
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

# postgresql

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  notifies :restart, "service[postgresql]", :immediately
end

postgresql_connection_info = {
  :host     => "localhost",
  :password => node['postgresql']['password']['postgres']
}

databases.each do |database|
  postgresql_database database do
    connection postgresql_connection_info
    encoding "utf8"
    action :create
  end
end

postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  privileges [:Superuser]
  password ""
  action :create
end

databases.each do |database|
  postgresql_database_user 'vagrant' do
    connection postgresql_connection_info
    database_name database
    privileges [:all]
    action :grant
  end
end

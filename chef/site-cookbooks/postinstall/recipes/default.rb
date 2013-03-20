#
# Cookbook Name:: postinstall
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group "rbenv" do
  action :create
  members "vagrant"
  gid 1100
  append true
end

bash "chgrp and chmod" do
  user "root"
  cwd "/usr/local"
  code <<-EOH
    chgrp -R rbenv rbenv
    chmod -R g+rwxX rbenv
  EOH
end

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
  not_if { ::File::stat("/usr/local/rbenv").gid == 1100 }
end

# git "/vagrant/rails" do
   # repository "git://github.com/rails/rails.git"
   # reference "master"
   # action :checkout
   # user  "vagrant"
   # group "vagrant"
# end

rbenv_script "migrate_rails_database" do
  rbenv_version "2.0.0-p0"
  user          "vagrant"
  group         "vagrant"
  cwd           "/vagrant/rails"
  code          %{bundle install}
end

rbenv_script "migrate_rails_database" do
  rbenv_version "2.0.0-p0"
  user          "vagrant"
  group         "vagrant"
  cwd           "/vagrant/rails"
  code          %{bundle exec rake db:create}
end

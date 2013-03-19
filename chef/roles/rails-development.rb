name "rails-development"
description "setup for ruby on rails core development"
run_list(
  "recipe[preinstall]",
  "recipe[git]",
  "recipe[sqlite]",
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rbenv::vagrant]",
  "recipe[mysql::client]",
  "recipe[mysql::ruby]",
  "recipe[mysql::server]",
  "recipe[postgresql::server]",
  "recipe[memcached]",
  "recipe[nodejs]",
  "recipe[database]",
  "recipe[postinstall]",
)

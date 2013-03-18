name "rails-development"
description "setup for ruby on rails core development"
run_list(
  "recipe[base]",
  "recipe[git]",
  "recipe[sqlite]",
  "recipe[mysql::client]",
  "recipe[mysql::ruby]",
  "recipe[mysql::server]",
  "recipe[postgresql::server]",
  "recipe[memcached]",
  "recipe[nodejs]",
  "recipe[database]",
)

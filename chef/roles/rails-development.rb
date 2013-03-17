name "rails-development"
description "setup for ruby on rails core development"
run_list(
  "recipe[base]",
  "recipe[git]",
  "recipe[sqlite]",
  "recipe[mysql]",
  "recipe[postgresql]",
  "recipe[memcached]"
)

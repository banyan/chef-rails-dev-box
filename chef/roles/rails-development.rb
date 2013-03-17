name "rails-development"
description "setup for ruby on rails core development"
run_list(
  "recipe[memcached]"
)

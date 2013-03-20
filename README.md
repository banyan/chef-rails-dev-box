# chef-rails-dev-box

A virtual machine for Ruby on Rails Core Development

This is port of [rails-dev-box](https://github.com/rails/rails-dev-box) using by chef.

## Caveats

Current status is WIP.

## Setup

```
host $ gem install knife-solo --pre # install 0.3.0
host $ gem install librarian vagrant

host $ git clone git@github.com:banyan/chef-rails-dev-box.git
host $ cd chef-rails-dev-box/chef
host $ librarian-chef install # install cookbooks by librarian

host $ vagrant up
host $ vagrant ssh
```

# chef-rails-dev-box

## Introduction

This project automates the setup of a development environment for Ruby on Rails core development.
This is port of [rails-dev-box](https://github.com/rails/rails-dev-box) using by chef.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

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

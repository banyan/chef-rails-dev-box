# chef-rails-dev-box

## Introduction

This project automates the setup of a development environment for Ruby on Rails core development.
This is port of [rails-dev-box](https://github.com/rails/rails-dev-box) using by Chef.

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
 * version required [v1.1.2](http://downloads.vagrantup.com/tags/v1.1.2) later.

## How To Build The Virtual Machine

Building the virtual machine is this easy:

```zsh
host $ git clone git@github.com:banyan/chef-rails-dev-box.git
host $ cd chef-rails-dev-box
host $ bundle install
host $ cd chef
host $ bundle exec librarian-chef install
host $ cd ../
host $ vagrant up
```

That's it.

If the base box is not present that command fetches it first. The setup itself takes about 15 minutes in my MacBook Air. After the installation has finished, you can access the virtual machine with

```zsh
$ vagrant ssh
Welcome to Ubuntu 12.04.1 LTS (GNU/Linux 3.2.0-29-generic x86_64)
...
vagrant@chef-rails-dev-box:~$
```

## Caveats

### For Windows User

When vagrant bootup, shared folder is mounted by using NFS.
NFS is not supported on Windows hosts. (See [document](http://docs-v1.vagrantup.com/v1/docs/nfs.html))

Comment this line if you are Windows user.

```diff
-  config.vm.share_folder("v-root", "/vagrant", ".", "nfs" => true)
+  # config.vm.share_folder("v-root", "/vagrant", ".", "nfs" => true)
```

## What's In The Box

* Git
* Ruby 2.0.0-p0 via rbenv
* Bundler
* SQLite3, MySQL, and Postgres
* System dependencies for nokogiri, sqlite3, mysql, mysql2, and pg
* Databases and users needed to run the Active Record test suite
* Node.js for the asset pipeline
* Memcached

## Recommended Workflow

The recommended workflow is

* edit in the host computer and
* test within the virtual machine.

Just clone your Rails fork in the very directory of the Rails development box in the host computer:

```
host $ ls
README.md   Vagrantfile puppet
host $ git clone git@github.com:rails/rails.git
```

Vagrant mounts that very directory as _/vagrant_ within the virtual machine:

```
vagrant@chef-rails-dev-box:~$ ls
/vagrant/chef  rails  README.md  Vagrantfile
```

so we are ready to go to edit in the host, and test in the virtual machine.

This workflow is convenient because in the host computer one normally has his editor of choice fine-tuned, Git configured, and SSH keys in place.

## Virtual Machine Management

```zsh
host $ vagrant suspend # just log out
host $ vagrant resume  # resume to hack again
host $ vagrant halt    # to shutdown
host $ vagrant up      # to boot it again
host $ vagrant status  # check status
host $ vagrant destroy # DANGER: all is gone
```

Please check the [Vagrant documentation](http://vagrantup.com/v1/docs/index.html) for more information on Vagrant.

Vagrant::Config.run do |config|
  config.vm.box       = "ubuntu-1204"
  config.vm.box_url   = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box'
  config.vm.host_name = 'rails-dev-box'

  config.vm.forward_port 4000, 4000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.roles_path     = "chef/roles"
    chef.data_bags_path = "chef/data_bags"

    chef.add_role "rails-development"
    chef.json = {
        :mysql => {
          :server_root_password   => '',
          :server_debian_password => '',
          :server_repl_password   => ''
        }
      }
  end
end

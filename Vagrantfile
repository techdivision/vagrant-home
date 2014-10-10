# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.4"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.4"

  config.vm.hostname = PROJECT_NAME + ".vm"

  # Create a private network, which allows host-only access to the machine
  config.vm.network "private_network", ip: IP_ADDRESS

  # adjust VirtualBox specific settings
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    # this allows use of our own 10.0.2.x network
    vb.customize ["modifyvm", :id, "--natnet1", "10.0.100.0/24"]
  end
  
    # adjust KVM/Libvirt specific settings
  config.vm.provider :libvirt do |libvirt|
  
	# use vagrant-mutate https://github.com/sciurus/vagrant-mutate to mutate virtualbox to libvirt
    # credits/original box (virtualbox): https://vagrantcloud.com/chef/boxes/debian-7.4
    config.vm.box = "http://vagrantcloud.joergboesche.de/chef/opscode_debian-7.4_chef-provisionerless-libvirt.box"
 
    # A hypervisor name to access. Different drivers can be specified, but
	# this version of provider creates KVM machines only. Some examples of
	# drivers are kvm (qemu hardware accelerated), qemu (qemu emulated),
	# xen (Xen hypervisor), lxc (Linux Containers),
	# esx (VMware ESX), vmwarews (VMware Workstation) and more. Refer to
	# documentation for available drivers (http://libvirt.org/drivers.html).
	libvirt.driver = "kvm"
	
	# Libvirt storage pool name, where box image and instance snapshots will
    # be stored.
    libvirt.storage_pool_name = "default"
 
    # use 2GB of RAM
    #lbvrt.memory = 2048
    libvirt.memory = 4096
    
	# use 2 cpus for the vm
	libvirt.cpus = 3
	
	# enable nested virtualization.
    libvirt.nested = true
	
	# type of disk device to emulate
    libvirt.disk_bus = "virtio"
	
	# this allows use of our own 10.0.2.x network
    libvirt.vm.network :private_network, :ip => "10.0.100.0/24", :model_type => "virtio"

  end

  # disable default shared folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # use your local SSH keys / agent even within the virtual machine
  config.ssh.forward_agent = true

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  # share site folder into releases folder
  config.vm.synced_folder ".", "/var/www/" + config.vm.hostname + "/releases/vagrant",
    type: "rsync",
    group: "web",
    rsync__args: ["--verbose", "--archive", "--delete", "-z", "--perms", "--chmod=Dg+s,Dg+rwx"],
    rsync__exclude: [
      ".git/",
      ".idea/",
      ".DS_Store",
      "Configuration/PackageStates.php",
      "Configuration/Production/" + PROJECT_NAME.gsub(".", "").capitalize + "vm",
      "Configuration/Development/" + PROJECT_NAME.gsub(".", "").capitalize + "vm",
      "Configuration/Testing/Behat",
      "Data/Sessions/**",
      "Data/Temporary/**",
      "Data/Persistent/**",
      "Data/Surf/**",
      "Data/Logs/**",
      "Web/_Resources/Persistent",
      "Web/_Resources/Static"
    ]

  # Install chef client
  config.vm.provision "shell", inline: "dpkg -s chef > /dev/null 2>&1 || (wget -O - http://opscode.com/chef/install.sh | sudo /bin/sh)"
  config.vm.provision "shell", inline: "apt-get update || apt-get install ruby-dev"

  # Provision with Chef Solo
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [ "~/.vagrant.d/chef/cookbooks", "~/.vagrant.d/chef/site-cookbooks" ]
    chef.roles_path = "~/.vagrant.d/chef/roles"
    chef.data_bags_path = "Build/Chef/data_bags"
#    chef.custom_config_path = "Vagrantfile.chef"

    chef.log_level = :debug

    chef.add_role "base"
    chef.add_role "vagrant"
    chef.add_role "databaseserver"
    chef.add_role "webserver"

    chef.json = {
    }
  end
end

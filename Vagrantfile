VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box      = "cybershade"
  config.vm.box_url  = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-i386-virtualbox-puppet.box"

  # Network
  config.vm.hostname = "electra.cybershade.org"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  
  # 1Gb Ram
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

end

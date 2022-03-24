# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "Proyecto-SO"
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--name', 'Proyecto-SO' ]
    vb.customize [ 'modifyvm', :id, '--cpus', '4' ]
    vb.customize [ 'modifyvm', :id, '--memory', '4096' ]
  end
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y jq
   SHELL
end

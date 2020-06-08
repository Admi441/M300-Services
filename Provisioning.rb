config.vm.provision :shell, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install apache2
SHELL
Vagrant.configure("2") do |config|
    config.vm.define :apache do |web|
        web.vm.box = "bento/ubuntu-16.04"
        web.vm.provision :shell, path: "config_web.sh"
        web.vm.hostname = "srv-web"
        web.vm.network :forwarded_port, guest: 80, host: 4567
        web.vm.network "public_network", bridge: "en0: WLAN (LC)"

    config.vm.provision :shell, inline: <<-SHELL
        sudo apt-get update
        sudo apt-get -y install apache2
    SHELL

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "6144"
end
    #!/bin/bash

    set -o errexit

    # Set up Vagrant.

    date > /etc/vagrant_box_build_time

    # Create the user vagrant with password vagrant
    useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant || true

    # Install vagrant keys
    mkdir -pm 700 /home/vagrant/.ssh || true
    curl -Lo /home/vagrant/.ssh/authorized_keys \
    'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
    chmod 0600 /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh

    # Install NFS client
    #apt-get -y install nfs-common
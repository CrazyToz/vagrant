#!/usr/bin/env bash

if ! which puppet; then
  echo "Please install Puppet before executing this script"
  exit 1
fi

if [ ! -d /vagrant/puppet/modules/java ]; then
  puppet module install puppetlabs-java --version 3.3.0 --target-dir /vagrant/puppet/modules
  puppet module install puppet-archive --version 3.2.1 --target-dir /vagrant/puppet/modules
  puppet module install puppetlabs-stdlib --version 5.2.0 --target-dir /vagrant/puppet/modules
  puppet module install puppetlabs-apt --version 7.0.0 --target-dir /vagrant/puppet/modules
  puppet module install puppet-nodejs --version 7.0.0 --target-dir /vagrant/puppet/modules
fi

echo "Printing installed Puppet modules"
puppet module list
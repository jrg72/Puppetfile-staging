class profile::base {
  include ntp

  file {'/etc/role.d':
    ensure => directory,
    mode   => '0644',
  }

  file {'/etc/role.d/location':
    ensure => directory,
    mode   => '0644',
  }

  file {'/etc/role.d/component':
    ensure => directory,
    mode   => '0644',
  }

  file {'/etc/role.d/platform':
    ensure => directory,
    mode   => '0644',
  }

  if str2bool("$is_virtual") {
    notice("Virtual Machine, not setting route to AWS.")
  }

  else {
    notice("Bare Metal Box, setting route to AWS."),
    network_route { '172.17.64.0/19':
      ensure    => 'present',
      gateway   => "${::network_internal_gw}
      interface => 'bond0',
      netmask   => '19',
      network   => '172.17.64.0',
    }
  }


}


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

}


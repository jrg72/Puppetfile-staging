class profile::base {
    class { '::ntp':
        servers => ['dxstg-ops-puppet01.devaws.dataxu.net','pool.ntp.org'],
    }
    class { '::mcollective':
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    }

}

class profile::ntp_primary {
    class { '::ntp':
        servers  => ['pool.ntp.org','utcnist.colorado.edu'],
        restrict => ['172.17.68.0 mask 255.255.252.0 nomodify notrap','10.0.0.0 mask 255.0.0.0 nomodify notrap'],
        udlc     => true,
    }

}

class profile::ldap_master {
    include ldap::master
}

class profile::bastion {
    class { '::mcollective':
        client            => true,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    }
    include vagrant
}

class role {
    include profile::base
}

class role::puppetmaster {
    include profile::ntp_primary
    class { '::mcollective':
        middleware       => true,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    }
}

class role::ldap_server {
    include profile::ldap_master
}

class role::bastion_server {
    include profile::bastion
}

node default {
    include role
    if $::facter_component != undef {
        include "role::$::facter_component"
    }

    #if $::facter_location != undef {
    #    include "role::$::facter_location"
    #}

    #if $::facter_platform != undef {
    #    include "role::$::facter_platform"
    #}
}

#node 'dxstg-ops-infra-master01.devaws.dataxu.net' {
#    include role::ldap_server
#    }

#node 'dxstg-ops-puppet01.devaws.dataxu.net' {
#    include role
#    if $::facter_component != undef {
#        include "role::$::facter_component"
#    }
#}

#node 'ip-172-17-71-114.ec2.internal' inherits default {
#
#}

class profile::mcollective {
    class { '::mcollective':
        connector        => rabbitmq,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    }

  $plugins = [  'service',
                'package',
                'nettest',
                'puppet',
                'filemgr',
                'iptables',
                ]

    mcollective::plugin { $plugins : package => true, }
}


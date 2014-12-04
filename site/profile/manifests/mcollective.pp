class profile::mcollective {
    $packages = [ 'mcollective',
                'mcollective-service-agent',
                'mcollective-package-agent',
                'mcollective-sysctl-data',
                'mcollective-nettest-agent',
                'mcollective-puppet-agent',
                'mcollective-filemgr-agent',
                'mcollective-iptables-agent',
                ]

    class { '::mcollective':
        connector        => rabbitmq,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    } ->
    package { $packages : ensure => latest }
}


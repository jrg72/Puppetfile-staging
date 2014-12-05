class role::bastion_server {
    $packages = [ 'mcollective-service-client',
                'mcollective-package-client',
                'mcollective-nettest-client',
                'mcollective-puppet-client',
                'mcollective-filemgr-client',
                'mcollective-iptables-client',
                ]

    package { $packages : ensure => latest }

}


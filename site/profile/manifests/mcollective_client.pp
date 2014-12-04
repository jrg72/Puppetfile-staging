class profile::mcollective_client {
    class { '::mcollective':
        connector        => rabbitmq,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
        client           => true,
    }
}

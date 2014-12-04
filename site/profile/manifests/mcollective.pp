class profile::mcollective {
    class { '::mcollective':
        connector        => rabbitmq,
        middleware_hosts => [ 'dxstg-ops-puppet01.devaws.dataxu.net' ],
    }
}

class profile::mcollective::client {
    class { '::mcollective':
        client           => true,
    }
}

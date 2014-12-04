class role::bastion_server {
    include profile::mcollective
    include profile::mcollective::client
}


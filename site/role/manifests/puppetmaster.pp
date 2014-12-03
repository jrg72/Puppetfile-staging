class role::puppetmaster {
    include profile::mcollective
    include profile::ntp_server
}


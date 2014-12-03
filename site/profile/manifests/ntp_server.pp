class profile::ntp_server {
    class { '::ntp':
        restrict => ['172.17.68.0 mask 255.255.252.0 nomodify notrap','10.0.0.0 mask 255.0.0.0 nomodify notrap'],
        udlc     => true,
    }
}

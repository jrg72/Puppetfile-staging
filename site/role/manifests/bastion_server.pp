class role::bastion_server {
    class { '::mcollective':
      client    => true,
    }
    
}


class profile::rabbitmq {
  include erlang
  include rabbitmq
  
  class { '::rabbitmq':
    admin_enable  => true,
  }
  
  rabbitmq_user { 'mcollective_admin':
    admin    => true,
    password => 'bar',
  } ->

  rabbitmq_user { 'mcollective':
    admin    => true,
    password => 'test',
  } ->

  rabbitmq_vhost { '/mcollective':
    ensure   => present,
  } ->

  rabbitmq_user_permissions { 'mcollective_admin@/mcollective':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  } ->

  rabbitmq_user_permissions { 'mcollective@/mcollective':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  } ->

  rabbitmq_exchange { 'mcollective_broadcast@/mcollective':
    ensure   => present,
    user     => 'mcollective_admin',
    password => 'bar',
    type     => 'topic',
  }

  rabbitmq_exchange { 'mcollective_directed@/mcollective':
    ensure   => present,
    user     => 'mcollective_admin',
    password => 'bar',
    type     => 'direct',
  }

  rabbitmq_exchange { 'mcollective_reply@/mcollective':
    ensure   => present,
    user     => 'mcollective_admin',
    password => 'bar',
    type     => 'direct',
  }

}

class profile::rabbitmq {
  include erlang
  include rabbitmq

  include rabbitmq::params
  
  class { '::rabbitmq':
    manage_repos  => true,
    admin_enable  => true,
    stomp_ensure  => true,
    config_stomp  => true,
    stomp_port    => '61613',
  } ->
  
  rabbitmq_user { 'mcollective_admin':
    admin    => true,
    password => 'marionette',
  } ->

  rabbitmq_user { 'mcollective':
    admin    => true,
    password => 'marionette',
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
    password => 'marionette',
    type     => 'topic',
  }

  rabbitmq_exchange { 'mcollective_directed@/mcollective':
    ensure   => present,
    user     => 'mcollective_admin',
    password => 'marionette',
    type     => 'direct',
  }

  rabbitmq_exchange { 'mcollective_reply@/mcollective':
    ensure   => present,
    user     => 'mcollective_admin',
    password => 'marionette',
    type     => 'direct',
  }

}

class profile::consul::service {
  service { 'consul':
    ensure => running,
    enable => true,

  }
}


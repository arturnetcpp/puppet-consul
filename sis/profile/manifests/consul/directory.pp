class profile::consul::directory {
  file { "/etc/consul.d":
    ensure => directory,
  }
}


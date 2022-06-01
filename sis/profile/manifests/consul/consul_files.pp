class profile::consul::consul_files {
  file { "/etc/systemd/system/consul.service":
    ensure => file,
    mode => '0644',
    content => epp('profile/consul.service.epp'),
  }
}

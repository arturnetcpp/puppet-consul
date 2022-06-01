class profile::consul::ui {
  file { "/etc/consul.d/ui.json":
    path => "/etc/consul.d/ui.json",
    source => 'puppet:///modules/profile/ui.json',
  }
}


class profile::dockerprod::init {
  if $facts['os']['name'] == 'CentOS' {
    class { 'docker':
      version                     => '20.10.8-3.el7',
      bip                         => '10.10.10.1/24',
      use_upstream_package_source => false,
      prerequired_packages        => [ 'glibc.i686', 'glibc.x86_64', 'sqlite.i686', 'sqlite.x86_64', 'device-mapper', 'device-mapper-libs', 'device-mapper-event-libs', 'device-mapper-event' ],

    }
    docker::run { 'helloworld':
      image   => 'base',
      command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
    }
  }
}

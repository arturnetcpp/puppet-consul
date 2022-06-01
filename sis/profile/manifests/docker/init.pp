class profile::docker::init {
  if $facts['os']['name'] == 'CentOS' {
    class { 'docker':
      manage_package => true,
      package_name   => 'docker-engine',
    }   

  }


}


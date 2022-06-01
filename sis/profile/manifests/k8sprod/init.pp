class profile::k8sprod::init {
  if $facts['os']['name'] == 'CentOS' {
    class {'kubernetes':
          controller => true,
        }
  }
}

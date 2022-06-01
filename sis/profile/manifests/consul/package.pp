class profile::consul::package {
  case $facts['os']['family'] {
    'RedHat': {
     package { 'unzip':
       ensure => present,
     }
     archive {"/tmp/consul_1.7.3_linux_amd64.zip":
       ensure => present,
       extract => true,
       extract_path => '/tmp',
       source => 'https://releases.hashicorp.com/consul/1.7.3/consul_1.7.3_linux_amd64.zip',
       creates => '/tmp/consul',
       cleanup => true,
     }
     file {"/usr/bin/consul":
       path => "/usr/bin/consul",
       source => "/tmp/consul",
       mode => '0755',
     }
   }

 }
}


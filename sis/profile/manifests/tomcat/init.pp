# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::tomcat-prod::init
class profile::tomcat::init (
  String $omg_source_url = hiera('tomcat::install::source_url'),
  String $omg_catalina_home = hiera('tomcat::catalina_home'),
  String $omg_catalina_base = hiera('tomcat::catalina_base'),
  Integer $omg_port = hiera('tomcat::config::server::port'),
  String $omg_user = hiera('tomcat::user'),
  String $omg_group = hiera('tomcat::group'),
) {
 # if $facts['os']['name'] == 'CentOS' {
    class {'java': }
    class {'tomcat':
      catalina_home => "${omg_catalina_home}",
      user => "${omg_user}",
      group => "${omg_group}",
    }

    tomcat::install { '/opt/tomcat807':
      source_url => "${omg_source_url}",
    }

    file { "/etc/systemd/system/tomcat807.service":
      mode => "0644",
      source => 'puppet:///modules/profile/tomcat807.service',
    }

    exec { 'tomcatservice-systemd-reload':
      command     => 'systemctl daemon-reload',
      path        => [ '/usr/bin', '/bin', '/usr/sbin' ],
      refreshonly => true,
   }    

    service { 'tomcat807':
      ensure => running,
      enable => true,

    }

    tomcat::config::server::connector { 'tomcat807':
      catalina_base         => "${omg_catalina_base}",
      port                  => "${omg_port}",
      protocol              => 'HTTP/1.1',
      notify                => Service['tomcat807'],
    }

#    tomcat::war { 'mytomcat01.war':
#      catalina_base => "${omg_catalina_base}",
#      war_source    => 'puppet:///modules/profile/mytomcat01.war',
#      user	    => "${omg_user}",
#      group	    => "${omg_group}",
#      notify        => Service['tomcat806'],
#    }

}

class profile::consul::init {
  include profile::consul::package
  include profile::consul::consul_files
  include profile::consul::directory
  include profile::consul::ui
  include profile::consul::service
}


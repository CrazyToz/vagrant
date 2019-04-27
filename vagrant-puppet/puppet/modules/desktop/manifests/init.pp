class desktop () {

  package { 'task-xfce-desktop':
    ensure => installed
  }

  package { 'lightdm':
    ensure => installed,
    require => Package['task-xfce-desktop']
  }

  exec { 'Restart session':
    command => 'service lightdm restart',
    path    => '/usr/sbin:/usr/bin:/bin:/sbin'
  }

}
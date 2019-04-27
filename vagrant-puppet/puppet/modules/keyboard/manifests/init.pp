class keyboard () {

  file { 'Keyboard configuration':
    path   => '/etc/default/keyboard',
    source => 'puppet:///modules/keyboard/keyboard',
  }

  exec { 'Use service to install keyboard conf.':
    command => 'service keyboard-setup restart',
    path    => '/usr/sbin:/usr/bin:/bin:/sbin',
  }

  exec { 'Do some action, probalbly required ...':
    command => 'udevadm trigger --subsystem-match=input --action=change',
    path    => '/bin:/sbin'
  }

}
class devtools::curl () {

  exec { 'Update mirrors before curl':
    command => 'apt-get update',
    path    => '/bin:/sbin:/usr/bin',
  }

  package { 'curl':
    ensure  => installed,
    require => Exec['Update mirrors before curl']
  }

}
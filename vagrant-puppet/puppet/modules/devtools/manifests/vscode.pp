class devtools::vscode () {

  File {
    mode  => '0774',
    owner => 'root',
    group => 'root'
  }

  file { '/etc/apt/sources.list.d/vscode.list':
    content => 'deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main'
  }
  ->
  exec { 'Download gpg key':
    command => 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg',
    path    => '/bin:/sbin:/usr/bin',
  }
  ->
  exec { 'Move gpg key':
    command => 'mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg',
    cwd     => '/tmp',
    path    => '/bin:/sbin:/usr/bin',
  }
  ->
  exec { 'Update mirrors before vscode':
    command => 'apt-get update',
    path    => '/bin:/sbin:/usr/bin',
  }
  ->
  package { 'code':
    ensure => installed,
  }

}
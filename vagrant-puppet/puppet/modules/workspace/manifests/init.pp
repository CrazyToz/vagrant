class workspace (
  $user = 'vagrant',
) {

  $user_home = "/home/${user}"

  File {
    mode  => '0774',
    owner => $user,
    group => $user
  }

  file { "${user_home}/workspaces":
    ensure => directory
  }

  file { "${user_home}/.bash_aliases" :
    ensure => present,
    content => template('workspace/.bash_aliases.erb')
  }

}
class devtools::git (
  $os_user = 'vagrant',
  $scm_user,
  $scm_email
) {

  $os_user_home = "/home/${os_user}"

  package { 'git':
    ensure => installed
  }

  file { "$os_user_home/.gitconfig":
    ensure  => file,
    content => template('devtools/.gitconfig.erb'),
  }

}
class devtools::maven3 (
  $version = '3.6.1',
  $user    = 'vagrant'
) {

  exec { 'Download Maven version':
    command => "wget https://www-us.apache.org/dist/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz -P /tmp",
    cwd     => '/tmp',
    path    => '/bin:/sbin:/usr/bin',
  }

  exec { 'Extract Maven archive':
    command => 'tar xf /tmp/apache-maven-*.tar.gz -C /opt',
    cwd     => '/tmp',
    path    => '/bin:/sbin:/usr/bin',
    require => Exec['Download Maven version']
  }

  file { '/opt/maven':
    ensure  => 'link',
    target  => "/opt/apache-maven-${version}",
    require => Exec['Extract Maven archive']
  }

  file_line { 'Create M2_HOME env variable ':
    path    => "/home/${user}/.bashrc",
    line    => 'export M2_HOME=/opt/maven',
    require => File['/opt/maven']
  }

  file_line { 'Create MAVEN_HOME env variable ':
    path    => "/home/${user}/.bashrc",
    line    => 'export MAVEN_HOME=/opt/maven',
    require => File['/opt/maven']
  }

  file_line { 'Update PATH env variable ':
    path    => "/home/${user}/.bashrc",
    line    => 'export PATH=${M2_HOME}/bin:${PATH}',
    require => File['/opt/maven']
  }

}
class devtools::intellij (
  $user              = 'vagrant',
  $install_directory = '/opt/intellij',
  $package_name      = 'idea',
  $package_version   = '2019.1',
  $archive_name      = "${package_name}-${package_version}.tar.gz"
) {

  File {
    mode  => '0774',
    owner => $user,
    group => 'root'
  }

  file { $install_directory:
    ensure => directory
  }

  archive { $archive_name:
    ensure       => present,
    extract      => true,
    path         => "/tmp/${archive_name}",
    extract_path => $install_directory,
    creates      => "${install_directory}/${package_name}-${package_version}",
    source       => "https://download.jetbrains.com/idea/ideaIU-${package_version}.tar.gz",
    cleanup      => true,
  }

  file_line { 'Adding Intellij build number to user environment variables':
    path => "/home/${user}/.bashrc",
    line => 'export INTELLIJ_BUILD_NUMBER=$(ls /opt/intellij)',
  }

  file_line { 'Creates Intellij alias':
    path => "/home/${user}/.bash_aliases",
    line => "alias idea=\'sh ${install_directory}/\"\$INTELLIJ_BUILD_NUMBER\"/bin/idea.sh\'",
  }

}
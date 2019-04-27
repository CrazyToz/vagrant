node default {

  include desktop
  include keyboard
  include '::archive'
  include devtools
  include devtools::intellij
  include devtools::vscode
  include devtools::curl
  include devtools::maven3
  include workspace

  class { 'devtools::git':
    scm_user  => '*******************',
    scm_email => '*********@gmail.com'
  }

  class { 'java':
    package => 'openjdk-8-jdk'
  }

  class { 'nodejs': }

}
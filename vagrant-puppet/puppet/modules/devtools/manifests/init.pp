class devtools () {

  Class['workspace'] -> Class['devtools']
  Class['archive'] -> Class['devtools::intellij']
  Class['java'] -> Class['devtools::intellij']
  Class['devtools::curl'] -> Class['devtools::vscode']

}
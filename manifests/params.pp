class opensshpfs::params {
  case $operatingsystem {
    centos: {
      $sshd_packagename = "openssh",
      $sshd_servicename = "opensshd",
    }
    ubuntu: {
      $sshd_packagename = "openssh-server",
      $sshd_servicename = "ssh",
    }
    default: {
      fail("Unrecognized operating system for opensshpfs")
    }
  }
}

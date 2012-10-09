class opensshpfs::params {
  case $osfamily {
    redhat: { 
      $sshd_packagename = "openssh"
      $sshd_servicename = "opensshd"
    }
    debian: { 
      $sshd_packagename = "openssh-server" 
      $sshd_servicename = "ssh"
    }
    default: {
      fail("Unrecognized operating system for opensshpfs")
    }
  }
}

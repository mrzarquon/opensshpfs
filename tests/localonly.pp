#local only test of package file service
package {'openssh':
  name   => 'openssh',
  ensure => present,
}

file {'sshd_config':
  name    => '/etc/ssh/sshd_config',
  ensure  => file,
  owner   => root,
  group   => root,
  mode    => '0644',
  notify  => Service['opensshd'],
  content => "Protocol 2
SyslogFacility AUTHPRIV
PermitRootLogin yes 
PasswordAuthentication yes 
GSSAPIAuthentication no
GSSAPICleanupCredentials yes
UsePAM yes
ChallengeResponseAuthentication no
X11Forwarding yes
Subsystem sftp  /usr/libexec/openssh/sftp-server",
  
}

service {'opensshd':
  name    => 'opensshd',
  require => Package['openssh'],
}




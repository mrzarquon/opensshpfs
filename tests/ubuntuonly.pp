#local only test of package file service
package {'openssh-server':
  name   => 'openssh-server',
  ensure => present,
}

file {'sshd_config':
  name    => '/etc/ssh/sshd_config',
  ensure  => file,
  owner   => root,
  group   => root,
  mode    => '0600',
  notify  => Service['ssh'],
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

service {'ssh':
  name    => 'ssh',
  require => Package['openssh-server'],
}




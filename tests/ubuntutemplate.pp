#local only test of package file service

$PermitRootLogin = yes
$PasswordAuthentication = yes

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
  content => template("opensshpfs/sshd_config.erb"),
  notify  => Service['ssh'],
}

service {'ssh':
  name    => 'ssh',
  require => Package['openssh-server'],
}




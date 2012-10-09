#local only test of package file service

$PermitRootLogin = yes
$PasswordAuthentication = yes

package {'openssh':
  name   => 'openssh',
  ensure => present,
}

file {'sshd_config':
  name    => '/etc/ssh/sshd_config',
  ensure  => file,
  owner   => root,
  group   => root,
  mode    => '0600',
  content => template("opensshpfs/sshd_config.erb"),
  notify  => Service['opensshd'],
}

service {'opensshd':
  name    => 'opensshd',
  require => Package['openssh'],
}


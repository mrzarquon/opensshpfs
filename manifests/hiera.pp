#hiera example
class opensshpfs::generic(
  $sshd_packagename = $opensshpfs::params::sshd_packagename,
  $sshd_servicename = $opensshpfs::params::sshd_servicename
) inherits opensshpfs::params {

  $PermitRootLogin = hiera('PermitRootLogin')
  $PasswordAuthentication = hiera('PasswordAuthentication') 

  package { $sshd_packagename: 
    ensure => present,
  }

  file {'sshd_config':
    name    => '/etc/ssh/sshd_config',
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template("opensshpfs/sshd_config.erb"),
    notify  => Service[$sshd_servicename],
  }

  service {$sshd_servicename:
    require => Package[$sshd_packagename],
  }
}

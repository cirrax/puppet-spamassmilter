# 
class spamassmilter::config(
  Array  $options        = $spamassmilter::params::options,
  String $socket         = '',
  String $socketowner    = '',
  String $socketmode     = '',
  String $sysconfig_file = $spamassmilter::params::sysconfig_file,
) inherits spamassmilter::params {

  if $options != [] {
    $_options = join($options,' ')
    file_line { 'spamassmilter: options':
      ensure => present,
      path   => $sysconfig_file,
      line   => "OPTIONS=\"${$_options}\"",
      match  => '^OPTIONS=',
      notify => Service['spamass-milter'],
    }
  }

  if $socket != '' {
    file_line { 'spamassmilter: socket':
      ensure => present,
      path   => $sysconfig_file,
      line   => "SOCKET=\"${$socket}\"",
      match  => '^SOCKET=',
      notify => Service['spamass-milter'],
    }
  } else {
    file_line { 'spamassmilter: socket':
      ensure            => absent,
      path              => $sysconfig_file,
      match             => '^SOCKET=',
      match_for_absence => true,
      notify            => Service['spamass-milter'],
    }
  }

  if $socketowner != '' {
    file_line { 'spamassmilter: socketowner':
      ensure => present,
      path   => $sysconfig_file,
      line   => "SOCKETOWNER=\"${$socketowner}\"",
      match  => '^SOCKETOWNER=',
      notify => Service['spamass-milter'],
    }
  } else {
    file_line { 'spamassmilter: socketowner':
      ensure            => absent,
      path              => $sysconfig_file,
      match             => '^SOCKETOWNER=',
      match_for_absence => true,
      notify            => Service['spamass-milter'],
    }
  }

  if $socketmode != '' {
    file_line { 'spamassmilter: socketmode':
      ensure => 'present',
      path   => $sysconfig_file,
      line   => "SOCKETMODE=\"${$socketmode}\"",
      match  => '^SOCKETMODE=',
      notify => Service['spamass-milter'],
    }
  } else {
    file_line { 'spamassmilter: socketmode':
      ensure            => absent,
      path              => $sysconfig_file,
      match             => '^SOCKETMODE=',
      match_for_absence => true,
      notify            => Service['spamass-milter'],
    }
  }
}

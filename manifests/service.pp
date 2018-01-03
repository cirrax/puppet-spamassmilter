# 
class spamassmilter::service(
  $ensure = 'running',
  $enable = true,
) {

  service { 'spamass-milter':
    ensure  => $ensure,
    enable  => $enable,
    require => Package['spamass-milter'],
  }
}

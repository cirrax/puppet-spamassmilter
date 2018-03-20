# 
# Class to ensure the spamass-milter service
#
class spamassmilter::service(
  String  $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'spamass-milter':
    ensure  => $ensure,
    enable  => $enable,
    require => Package['spamass-milter'],
  }
}

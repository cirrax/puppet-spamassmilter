# 
# Class to ensure the spamass-milter service
# @param ensure
#   what to ensure for the service
# @param enable
#   if to enable the service
#
class spamassmilter::service (
  String  $ensure = 'running',
  Boolean $enable = true,
) {
  service { 'spamass-milter':
    ensure  => $ensure,
    enable  => $enable,
    require => Package['spamass-milter'],
  }
}

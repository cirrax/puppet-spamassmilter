#
class spamassmilter::install (
  $ensure = 'installed',
){

  include spamassmilter::params

  package{ 'spamass-milter':
    ensure => $ensure,
    name   => $spamassmilter::params::package_name,
  }
}

#
# Class to install spamass-milter package
#
class spamassmilter::install (
  String $ensure = 'installed',
){

  include ::spamassmilter::params

  package{ 'spamass-milter':
    ensure => $ensure,
    name   => $spamassmilter::params::package_name,
  }
}

#
# Class to install spamass-milter package
# @param ensure
#    what to ensure for package
#
class spamassmilter::install (
  String $ensure = 'installed',
) {
  include spamassmilter::params

  package { 'spamass-milter':
    ensure => $ensure,
    name   => $spamassmilter::params::package_name,
  }
}

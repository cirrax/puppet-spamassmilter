
class spamassmilter::params {

  case $::osfamily {
    'Debian': {
      $package_name = 'spamass-milter'
    }
    default: {
      fail("${::operatingsystem} is not supported by the spamassmilter module.")
    }
  }
}

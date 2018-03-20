
class spamassmilter::params {

  case $::osfamily {
    'Debian': {
      $package_name   = 'spamass-milter'
      $sysconfig_file = '/etc/default/spamass-milter'
      $options        = [
        '-u spamass-milter',
        '-i 127.0.0.1',
      ]
    }
    default: {
      fail("${::operatingsystem} is not supported by the spamassmilter module.")
    }
  }
}

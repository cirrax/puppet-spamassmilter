
class spamassmilter::params {

  case $facts['os']['family'] {
    'Debian': {
      $package_name   = 'spamass-milter'
      $sysconfig_file = '/etc/default/spamass-milter'
      $options        = [
        '-u spamass-milter',
        '-i 127.0.0.1',
      ]
    }
    default: {
      fail("${facts['os']['name']} is not supported by the spamassmilter module.")
    }
  }
}

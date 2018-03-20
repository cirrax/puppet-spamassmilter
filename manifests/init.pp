#
class spamassmilter (
) {

  Class['::spamassmilter::install']
  -> Class['::spamassmilter::config']
  -> Class['::spamassmilter::service']

  include ::spamassmilter::install
  include ::spamassmilter::config
  include ::spamassmilter::service

}


require 'spec_helper'

describe 'spamassmilter::service' do
  context  "on Debian" do
    let(:facts) do
      {
        :osfamily => 'Debian'
      }
    end
    let(:pre_condition) { 'class {"::spamassmilter::install": }' }

    it 'configures service' do 
      is_expected.to contain_service('spamass-milter').with(
        :ensure => 'running',
        :enable => true,
      )
    end
  end
end

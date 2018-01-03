
require 'spec_helper'

describe 'spamassmilter' do
  context  "on Debian" do
    let(:facts) do
      {
        :osfamily => 'Debian'
      }
    end
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_class('spamassmilter::install') }
    it { is_expected.to contain_class('spamassmilter::service') }
  end
end


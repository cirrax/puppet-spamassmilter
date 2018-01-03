
require 'spec_helper'

describe 'spamassmilter::install' do
  context  "on Debian" do
    let(:facts) do
      {
        :osfamily => 'Debian'
      }
    end
    it { is_expected.to compile.with_all_deps }
  end
end


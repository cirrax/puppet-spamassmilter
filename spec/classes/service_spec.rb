# frozen_string_literal: true

require 'spec_helper'

describe 'spamassmilter::service' do
  let(:pre_condition) { 'class {"::spamassmilter::install": }' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it 'configures service' do
        is_expected.to contain_service('spamass-milter').with(
          ensure: 'running',
          enable: true,
        )
      end
    end
  end
end


require 'spec_helper'

describe 'spamassmilter::config' do
  let(:pre_condition) { ['include spamassmilter::service', 'include spamassmilter::install'] }
  let :facts do  { :osfamily => 'Debian' } end
  let :default_params do
     {  :options        => ['-u spamass-milter', '-i 127.0.0.1'],
        :socket         => '',
        :socketowner    => '',
        :socketmode     => '',
        :sysconfig_file => '/etc/default/spamass-milter',
     }
  end


  shared_examples_for 'spamassmilter::config' do

    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_file_line('spamassmilter: options')
      .with_ensure('present')
      .with_path( params[:sysconfig_file] )
      .with_match( '^OPTIONS=' )
      .with_notify( 'Service[spamass-milter]' )
    }
    it { is_expected.to contain_file_line('spamassmilter: socket')
      .with_path( params[:sysconfig_file] )
      .with_match( '^SOCKET=' )
      .with_notify( 'Service[spamass-milter]' )
    }
    it { is_expected.to contain_file_line('spamassmilter: socketowner')
      .with_path( params[:sysconfig_file] )
      .with_match( '^SOCKETOWNER=' )
      .with_notify( 'Service[spamass-milter]' )
    }
    it { is_expected.to contain_file_line('spamassmilter: socketmode')
      .with_path( params[:sysconfig_file] )
      .with_match( '^SOCKETMODE=' )
      .with_notify( 'Service[spamass-milter]' )
    }

  end

  describe 'without parameters' do
    let :params do
      default_params
    end
    it_behaves_like 'spamassmilter::config'
    it { is_expected.to contain_file_line('spamassmilter: options')
       .with_line ( 'OPTIONS="-u spamass-milter -i 127.0.0.1"')
    }
    it { is_expected.to contain_file_line('spamassmilter: socket')
      .with_ensure('absent')
      .with_match_for_absence(true)
    }
    it { is_expected.to contain_file_line('spamassmilter: socketowner')
      .with_ensure('absent')
      .with_match_for_absence(true)
    }
    it { is_expected.to contain_file_line('spamassmilter: socketmode')
      .with_ensure('absent')
      .with_match_for_absence(true)
    }
  end

  describe 'with options' do
    let :params do
      default_params.merge(
        :options      => ['-x abc', '-y cba'],
      )
    end

    it_behaves_like 'spamassmilter::config'

    it { is_expected.to contain_file_line('spamassmilter: options')
       .with_line ( 'OPTIONS="-x abc -y cba"')
    }
  end

  describe 'without defined socket' do
    let :params do
      default_params.merge(
        :socket      => '/tmp/socket',
        :socketowner => 'postfix:postfix',
        :socketmode  => '0700',
      )
    end

    it_behaves_like 'spamassmilter::config'

    it { is_expected.to contain_file_line('spamassmilter: options')
       .with_line ( 'OPTIONS="-u spamass-milter -i 127.0.0.1"')
    }
    it { is_expected.to contain_file_line('spamassmilter: socket')
      .with_ensure('present')
      .with_line ( 'SOCKET="/tmp/socket"')
    }
    it { is_expected.to contain_file_line('spamassmilter: socketowner')
      .with_ensure('present')
      .with_line ( 'SOCKETOWNER="postfix:postfix"')
    }
    it { is_expected.to contain_file_line('spamassmilter: socketmode')
      .with_ensure('present')
      .with_line ( 'SOCKETMODE="0700"')
    }
  end
  
end

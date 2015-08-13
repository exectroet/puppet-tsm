require 'spec_helper'

describe 'tsm::installpkg', :type => :define do
  let(:title) { 'TIVsm-BA'}

  context 'on Redhat' do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it { should contain_package('TIVsm-BA').with_ensure('installed') }
  end

  context 'on Debian' do
    let(:title) { 'tivsm-ba'}

    let :facts do
    {
      :osfamily => 'Debian'
    }
    end

    it { should contain_package('tivsm-ba').with_ensure('installed') }
  end

  context 'on Solaris' do
    let :facts do
      {
        :osfamily => 'Solaris'
      }
    end

    let :params do
      {
        :adminfile => '/adminfile',
        :uri       => 'http://server/pkg'
      }
    end

    it do
      should contain_package('TIVsm-BA').with({
                                                'ensure'          => 'installed',
                                                'source'          => 'http://server/pkg/TIVsm-BA.pkg',
                                                'adminfile'       => '/adminfile',
                                                'install_options' => ['-G'],
                                                'provider'        => 'sun'
                                              })
    end
  end

  context 'on AIX' do
    let(:title) { 'tivoli.tsm.client.ba.64bit.base'}
      
    let :facts do
    {
      :osfamily => 'AIX'
    }
    end

    it { should contain_package('tivoli.tsm.client.ba.64bit.base').with_ensure('installed') }
  end

end

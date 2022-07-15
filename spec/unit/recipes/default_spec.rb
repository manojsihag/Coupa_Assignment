#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    describe 'included recipies' do
      it { is_expected.to include_recipe 'apache::server' }
    end

    it 'installs the correct package' do
      expect(chef_run).to install_package('apache2')
      expect(chef_run).to install_package('php')
    end

    it 'creates an default html file' do
      expect(chef_run).to create_file('var/www/html/index.html')
    end

    it 'starts the service' do
      expect(chef_run).to start_service('apache2')
    end

    it 'enables the service' do
      expect(chef_run). to enable_service('apache2')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'centos', '7'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

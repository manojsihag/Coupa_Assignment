#
# Cookbook:: apache
# Spec:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::server' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'installs the correct package' do
      expect(chef_run).to install_package('apache2')
      expect(chef_run).to install_package('php')
    end
  end
end

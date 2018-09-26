#
# Cookbook:: first_cookbook
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'first_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs apache2' do
      expect(chef_run).to install_package('apache2')
    end

    it 'installs java' do
      expect(chef_run).to install_package('default-jre')
    end

    it 'creates index.html' do
      expect(chef_run).to create_template(chef_run.node['first_cookbook']['index_path_location'])
    end

    it 'does not create index.php' do
      expect(chef_run).to_not create_template('/var/www/html/index.php')
    end

    it 'creates a remote file that should download success.html' do
      expect(chef_run).to create_remote_file('/var/www/html/success.html').with(source: 'https://raw.githubusercontent.com/dobrescu/chef-webinar/master/standalone/success.html')
    end

    it 'starts apache2 service' do
      expect(chef_run).to start_service('apache2')
    end

    it 'enables apache2 service' do
      expect(chef_run).to enable_service('apache2')
    end

    it 'includes the bogus recipe' do
      expect(chef_run).to include_recipe('first_cookbook::bogus')
    end

  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd' do
      expect(chef_run).to install_package('httpd')
    end


  end
end

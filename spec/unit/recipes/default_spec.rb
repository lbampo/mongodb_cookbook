#
# Cookbook:: mongo
# Spec:: default
#
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# This is Unit testing (Making sure test syntax is correct)

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'Converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should update source list' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it 'Should add mongod to source list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end

    it 'Should install mongodb' do
      expect(chef_run).to install_package 'mongodb-org'
    end

    it 'enables mongod service' do
      expect(chef_run).to enable_service 'mongod'
    end



    it 'starts mongod service' do
      expect(chef_run).to start_service 'mongod'
    end



    it 'should create mongod.conf template in /etc/mongod.conf' do
      expect(chef_run).to create_template '/etc/mongod.conf'
    end



    it 'should create mongod.service template in /etc/systemd/system/mongod.service' do
      expect(chef_run).to create_template '/etc/systemd/system/mongod.service'
    end
  end
end

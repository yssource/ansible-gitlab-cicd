require 'spec_helper'

describe 'gitlab-runner' do
  describe package('gitlab-runner') do
    it { should be_installed.with_version('13.7.0') }
  end

  %w(/etc/gitlab-runner
     /etc/gitlab-runner/certs
   ).each do |gitlabDir|
      # puts "#{cert}"
       describe file "#{gitlabDir}" do
         it { should exist }
         it { should be_directory }
         end
     end
end

%w(docker-ce
   docker-ce-cli
   containerd.io
   iptraf-ng
   sysstat
   rsyslog
   bc
  ).each do |pkg|
   describe package "#{pkg}" do
     it { should be_installed }
     end
  end

  %w(/etc/gitlab-runner/certs/usctvltstgitlbrn01v.curbstone.com.key
     /etc/gitlab-runner/certs/usctvltstgitlbrn01v.curbstone.com.crt
     /etc/gitlab-runner/certs/ca.crt
   ).each do |sslcert|
       describe file "#{sslcert}" do
         it { should exist }
         it { should be_file }
         end
    end

    describe service('docker') do
      it { should be_enabled }
      it { should be_running }
    end
    
    describe file "/etc/systemd/system/docker.service.d" do
      it { should be_directory }
    end

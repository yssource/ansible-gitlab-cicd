require 'spec_helper'

describe 'gitlab-runner' do
  describe package('gitlab-rnner') do
    it { should be_installed.with_version('13.7.0') }
  end

  %w(/etc/gitlab/gitlab.rb
   ).each do |gitlabDir|
      # puts "#{cert}"
       describe file "#{gitlabDir}" do
         it { should exist }
         it { should be_file }
         end
     end
end

%w(80
   443
   9090).each do |port|
        describe port("#{port}") do
          it { should be_listening }
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

  %w(/etc/gitlab-runner/certs/usctvltstgitlbci01v.curbstone.com.key
     /etc/gitlab-runner/certs/usctvltstgitlbci01v.curbstone.com.crt
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

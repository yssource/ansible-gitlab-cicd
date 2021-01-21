require 'spec_helper'

describe 'gitlab-ee' do
  describe package('gitlab-ee') do
    it { should be_installed.with_version('13.7.1-ee.0') }
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

describe file "/etc/gitlab/ssl" do
  it { should exist }
  it { should be_directory }
  end

  describe 'gitlab-ee' do
    describe package('gitlab-ee') do
      it { should be_installed.with_version('13.7.1-ee.0') }
    end
  end

%w(bc
   jq
   git
   wget
   gzip
   curl
   unzip
   sysstat
   iptraf
   iptraf-ng
   rsyslog
   postfix
   logrotate
   docker-ce
   docker-ce-cli
   containerd.io
   openssh-server
  ).each do |pkg|
   describe package "#{pkg}" do
     it { should be_installed }
     end
  end

  %w(/etc/gitlab/ssl/usctvltstgitlbci01v.curbstone.com.key
     /etc/gitlab/ssl/usctvltstgitlbci01v.curbstone.com.crt
     /etc/gitlab/ssl/ca.crt
   ).each do |sslcert|
       describe file "#{sslcert}" do
         it { should exist }
         it { should be_file }
         end
    end

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

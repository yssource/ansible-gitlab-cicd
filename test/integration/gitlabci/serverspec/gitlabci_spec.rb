require 'spec_helper'

describe 'gitlab-ee' do
  describe package('gitlab-ee') do
    it { should be_installed }
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

# InSpec test for recipe apache::default
# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


describe package 'apache2' do
  it { should be_installed }
end

describe package 'php' do
 it { should be_installed }
end


describe command('service apache2 status') do
  its('stdout') { should match (/[* apache2 is running]/) }
end

describe command('curl localhost') do
  its('stdout') { should match (/[<h1>Hello, world!<h1>
  IPADDRESS: 
  HOSTNAME: 33f1a7972687]/) }
end

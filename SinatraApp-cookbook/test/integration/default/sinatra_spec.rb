require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'sinatra installation' do

  it 'has a running service of unicorn' do
    expect(service('unicorn')).to be_running
  end

  it 'has a running service of nginx' do
    expect(service('nginx')).to be_running
  end
end

describe file('/etc/init.d/unicorn') do
  it { should be_file }
end

describe file('/var/www/unicorn.rb') do
  it { should be_file }
end

describe file('/var/www/index.rb') do
  it { should be_file }
end

describe file('/var/www/config.ru') do
  it { should be_file }
end
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/opt/EpsonJavaPOS") do
  it { should be_directory }
end

describe service('epson_devicecontrollogserviced') do
  it { should be_enabled }
  it { should be_running }
end

describe service('epson_pcsvcd') do
  it { should be_enabled }
  it { should be_running }
end


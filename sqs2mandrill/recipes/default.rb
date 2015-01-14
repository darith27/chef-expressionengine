apt_package "build-essential" do
  action :install
end

apt_package "ruby2.0" do
  action :install
end

apt_package "ruby2.0-dev" do
  action :install
end

gem_package "sqs2mandrill" do
  action :install
end

template "/etc/init/sqs2mandrill.conf" do
  source "sqs2mandrill.conf"
end

template "/etc/init/sqs2mandrill-sqs2mandrill.conf" do
  source "sqs2mandrill-sqs2mandrill.conf"
end

template "/etc/init/sqs2mandrill-sqs2mandrill-1.conf" do
  source "sqs2mandrill-sqs2mandrill-1.conf.erb"
end

file "/var/log/sqs2mandrill.log" do
  owner "ubuntu"
end

service "sqs2mandrill" do
  action :start
end

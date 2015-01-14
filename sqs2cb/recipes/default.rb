#include_recipe "apt"

#apt_repository "brightbox-ruby-ng" do
  #uri "http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu"
  #distribution "trusty"
  #components ["main"]
  #keyserver "hkp://keyserver.ubuntu.com:80"
  #key "C3173AA6"
#end

apt_package "build-essential" do
  action :install
end

apt_package "ruby2.0" do
  action :install
end

apt_package "ruby2.0-dev" do
  action :install
end

gem_package "sqs2cb" do
  action :install
end

template "/etc/init/sqs2cb.conf" do
  source "sqs2cb.conf"
end

template "/etc/init/sqs2cb-sqs2cb.conf" do
  source "sqs2cb-sqs2cb.conf"
end

template "/etc/init/sqs2cb-sqs2cb-1.conf" do
  source "sqs2cb-sqs2cb-1.conf.erb"
end

file "/var/log/sqs2cb.log" do
  owner "ubuntu"
end

service "sqs2cb" do
  action :start
end

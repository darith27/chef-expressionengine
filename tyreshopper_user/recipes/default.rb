chef_gem 'ruby-shadow'

package "s3cmd" do
  action "install"
end

group "admin" do
  action :create
end

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports :manage_home => true
end

directory "/home/#{node[:user][:name]}/.ssh" do
  owner node[:user][:name]
end

template "/home/#{node[:user][:name]}/.ssh/config" do
  source "ssh_config.erb"
  owner node[:user][:name]
end

template "/home/#{node[:user][:name]}/.ssh/#{node[:application][:deploy_key]}" do
  source "github_private_deploy_key.erb"
  owner node[:user][:name]
  mode '0600'
end

template "/home/#{node[:user][:name]}/.ssh/#{node[:dataflex_service][:deploy_key_name]}" do
  source "github_dataflex_service_deploy_key.erb"
  owner node[:user][:name]
  mode '0600'
end

cookbook_file "/home/#{node[:user][:name]}/.ssh/known_hosts" do
  source "github_known_hosts"
  owner node[:user][:name]
end

cookbook_file "/home/#{node[:user][:name]}/.ssh/authorized_keys" do
  source "authorized_keys"
  owner node[:user][:name]
end

template "/home/#{node[:user][:name]}/.s3cmd" do
  source "s3cmd.erb"
  owner node[:user][:name]
  mode '0600'
end

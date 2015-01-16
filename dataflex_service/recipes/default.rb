directory node[:dataflex_service][:home] do
  owner node[:user][:name]
  recursive true
end

directory "#{node[:dataflex_service][:home]}/shared" do
  recursive true
  owner node[:user][:name]
end

directory "#{node[:dataflex_service][:home]}/shared/vendor/bundle" do
  recursive true
  owner node[:user][:name]
end

directory "#{node[:dataflex_service][:home]}/shared/pids" do
  recursive true
  owner node[:user][:name]
end

directory "#{node[:dataflex_service][:home]}/shared/log" do
  recursive true
  owner node[:user][:name]
end

directory "#{node[:dataflex_service][:home]}/shared/config" do
  recursive true
  owner node[:user][:name]
end

if node[:opsworks][:instance][:layers].include? "workers"
  template "/etc/init/dataflex-service.conf" do
    source "dataflex-service.conf.erb"
  end

  template "/etc/init/dataflex-service-clock.conf" do
    source "dataflex-service-clock.conf.erb"
  end
end

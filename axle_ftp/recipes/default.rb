package "vsftpd" do
  action :install
end

remote_file "/etc/vsftpd.conf" do
  owner "root"
  group "root"
  mode 0755
  source "vsftpd.conf"
  action :create
end

directory "/srv/ftp/viking" do
  owner "root"
  group "root"
  mode 0755
end

directory "/var/log/vsftpd" do
  owner "root"
  group "root"
  mode 0755
end

user "viking user" do
  username "viking"
  password "$1$Q5Am/Bo6$ziFkF7jFwcHCuKwBqxLFJ0"
  home "/srv/ftp/viking"
  action :create
end

group "viking_ftp" do
  members ["viking", "deploy", "ubuntu"]
end

execute 'change viking owner' do
  command 'chown viking:viking_ftp /srv/ftp/viking'
end

directory "/srv/ftp/viking/orders" do
  owner "viking"
  group "viking_ftp"
  mode 0775
end

directory "/srv/ftp/viking/delete" do
  owner "viking"
  group "viking_ftp"
  mode 0775
end

directory "/srv/ftp/viking/deleted" do
  owner "viking"
  group "viking_ftp"
  mode 0775
end

directory "/srv/ftp/viking/processed" do
  owner "viking"
  group "viking_ftp"
  mode 0775
end

execute 'remove all write from root folder' do
  command "chmod a-w /srv/ftp/viking"
end

["orders", "delete", "deleted", "processed"].each do |folder|
  execute 'set stickybit on delete' do
    command "chmod -R g+s /srv/ftp/viking/#{folder}"
  end
end

execute "restart ftp" do
  command %Q{
    /etc/init.d/vsftpd restart
  }
end

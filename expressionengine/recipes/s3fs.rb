
packages = ["build-essential", "git", "libfuse-dev", "libcurl4-openssl-dev", "libxml2-dev", "mime-support", "automake", "libtool", "pkg-config", "libssl-dev"]
packages.each do |name|
  package name
end

bash "install s3fs" do
  user "root"
  cwd "/usr/local/src"
  code <<-EOH
    git clone https://github.com/s3fs-fuse/s3fs-fuse
    cd s3fs-fuse/
    ./autogen.sh
    ./configure --prefix=/usr --with-openssl
    make
    sudo make install
  EOH
end

template "/etc/passwd-s3fs" do
  source "passwd-s3fs.erb"
  mode "0640"
end

directory "/tmp/cache" do
  mode "0777"
end

directory "/mnt/ee-tyreshopper" do
  mode "0777"
end

mount "/mnt/ee-tyreshopper" do
  device "s3fs#ee-tyreshopper"
  fstype "fuse"
  dump 0
  pass 0
  options "allow_other,passwd_file=/etc/passwd-s3fs,use_cache=/tmp/cache,retries=20,rw"
  action [:mount, :enable]
  not_if "mountpoint -q /mnt/ee-tyreshopper"
end

bash "setup mount in fstab" do
  user "root"
  cwd "/etc"
  code <<-EOH
    echo "s3fs#ee-tyreshopper /mnt/ee-tyreshopper fuse allow_other 0 0" >> fstab
  EOH
end


# apt-get install build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool
# apt-get install pkg-config libssl-dev # See (*3)
# git clone https://github.com/s3fs-fuse/s3fs-fuse
# cd s3fs-fuse/
# ./autogen.sh
# ./configure --prefix=/usr --with-openssl
# make
# sudo make install


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

# create credentials file /etc/passwd-s3fs
# chmod 640 /etc/passwd-s3fs
# setup fstab
# mount s3 bucket as /mnt/ee-tyreshopper

# /usr/bin/s3fs mybucket /mnt

# symlink shared/assets > /mnt/ee-tyreshopper/assets

# -o allow_other
node[:deploy].each do |app_name, deploy|
  app_root = "#{deploy[:deploy_to]}/current"

  directory "#{app_root}/images" do
    recursive true
    action :delete
  end

  directory "#{app_root}/assets" do
    recursive true
    action :delete
  end

  directory "#{deploy[:deploy_to]}/shared/images" do
    mode '0666'
    recursive true
    action :create
  end

  directory "#{deploy[:deploy_to]}/shared/assets" do
    mode '0666'
    recursive true
    action :create
  end

  link "#{app_root}/images" do
    to "#{deploy[:deploy_to]}/shared/images"
  end
  link "#{app_root}/assets" do
    to "/mnt/ee-tyreshopper/assets"
  end

  file "#{app_root}/system/expressionengine/config/config.php" do
    mode '0666'
    action :create
  end
  file "#{app_root}/system/expressionengine/config/database.php" do
    mode '0666'
    action :create
  end

  directory "#{app_root}/system/expressionengine/cache/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/avatars/uploads/" do
    mode '0777'
    recursive true
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/captchas/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/member_photos/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/pm_attachments/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/signature_attachments/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/uploads/" do
    mode '0777'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/made/" do
    mode '0775'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/remote/" do
    mode '0775'
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/assets/" do
    mode '0777'
    recursive true
    action :create
  end
  directory "#{deploy[:deploy_to]}/shared/images/" do
    mode '0777'
    recursive true
    action :create
  end

  directory "#{deploy[:deploy_to]}/shared/assets/" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/site" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/site/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/branches" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/branches/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/branches/_thumbnail" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/symbols" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/symbols/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/promo" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/promo/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/promo/_homepage" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/carousel" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/carousel/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/carousel/_cropped" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/manufactuers" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/manufactuers/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/manufactuers/_small" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/landing_pages" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/images/landing_pages/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/fonts" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/fonts/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/icons" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end
  directory "#{deploy[:deploy_to]}/shared/assets/icons/_thumbs" do
    mode '0777'
    recursive true
    action :create
    owner "deploy"
    group "www-data"
  end






end


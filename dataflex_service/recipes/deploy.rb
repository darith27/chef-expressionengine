include_recipe "dataflex_service"

gem_package "bundler" do
  version "1.3.5"
end

deploy node[:dataflex_service][:home] do
  repo "dataflex_service:EmergeAdapt/dataflex_service.git"

  user node[:user][:name]
  revision node[:dataflex_service][:branch]
  migrate false
  environment "RAILS_ENV" => node[:application][:ea_env]
  shallow_clone true
  action :deploy # or :rollback
  before_restart do
    execute "bundle install" do
      cwd release_path
      environment "HOME" => "/home/#{node[:user][:name]}"
      command <<-EOS
        ln -s #{node[:dataflex_service][:home]}/shared/vendor/bundle #{release_path}/bundle
        bundle install --binstubs --path bundle --without development test
      EOS
    end
  end
end

#if node[:opsworks][:instance][:layers].include? "workers"
#  execute "restart dataflex-service" do
#    command "service dataflex-service restart"
#  end
#end

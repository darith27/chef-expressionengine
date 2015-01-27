node[:deploy].each do |app_name, deploy|
  app_root = "#{deploy[:deploy_to]}/current"

  ["mysql2", "activesupport", "aws-sdk-v1"].each do |name|
    gem_package name
  end

  cron "test_ruby_script" do
    action :create
    minute '0'
    hour '15'
    mailto "stewart@emergeadapt.com"
    home deploy[:deploy_to] + "/current/scripts"
    command "/bin/bash -e 'DB_HOST=#{node[:expressionengine][:database][:host]} DB_USERNAME=#{node[:expressionengine][:database][:username]} DB_PASSWORD=#{node[:expressionengine][:database][:password]} DATABASE=#{node[:expressionengine][:database][:name]} AWS_SECRET_ACCESS_KEY=#{node[:aws][:secret_key]} AWS_ACCESS_KEY=#{node[:aws][:access_key]} EE_HOST=#{node[:expressionengine][:api][:host]} EE_USERNAME=#{node[:expressionengine][:api][:username]} EE_PASSWORD=#{node[:expressionengine][:api][:password]} ruby test_ruby_script.rb'"
  end

  # cron "6_month_mailer" do
  #   action :create
  #   minute '0'
  #   hour '13'
  #   mailto "stewart@emergeadapt.com"
  #   home deploy[:deploy_to] + "/current/scripts"
  #   command "DB_HOST=#{node[:expressionengine][:database][:host]} DB_USERNAME=#{node[:expressionengine][:database][:username]} DB_PASSWORD=#{node[:expressionengine][:database][:password]} DATABASE=#{node[:expressionengine][:database][:name]} AWS_SECRET_ACCESS_KEY=#{node[:aws][:secret_key]} AWS_ACCESS_KEY=#{node[:aws][:access_key]} EE_HOST=#{node[:expressionengine][:api][:host]} EE_USERNAME=#{node[:expressionengine][:api][:username]} EE_PASSWORD=#{node[:expressionengine][:api][:password]} ./execute_ruby_script loyalty_emails_sender.rb"
  # end

  # cron "3_month_mailer" do
  #   action :create
  #   minute '0'
  #   hour '14'
  #   mailto "stewart@emergeadapt.com"
  #   home deploy[:deploy_to] + "/current/scripts"
  #   command "DB_HOST=#{node[:expressionengine][:database][:host]} DB_USERNAME=#{node[:expressionengine][:database][:username]} DB_PASSWORD=#{node[:expressionengine][:database][:password]} DATABASE=#{node[:expressionengine][:database][:name]} AWS_SECRET_ACCESS_KEY=#{node[:aws][:secret_key]} AWS_ACCESS_KEY=#{node[:aws][:access_key]} EE_HOST=#{node[:expressionengine][:api][:host]} EE_USERNAME=#{node[:expressionengine][:api][:username]} EE_PASSWORD=#{node[:expressionengine][:api][:password]} ./execute_ruby_script tyre_review_email_sender.rb"
  # end

  # cron "1_week_mailer" do
  #   action :create
  #   minute '0'
  #   hour '15'
  #   mailto "stewart@emergeadapt.com"
  #   home deploy[:deploy_to] + "/current/scripts"
  #   command "DB_HOST=#{node[:expressionengine][:database][:host]} DB_USERNAME=#{node[:expressionengine][:database][:username]} DB_PASSWORD=#{node[:expressionengine][:database][:password]} DATABASE=#{node[:expressionengine][:database][:name]} AWS_SECRET_ACCESS_KEY=#{node[:aws][:secret_key]} AWS_ACCESS_KEY=#{node[:aws][:access_key]} EE_HOST=#{node[:expressionengine][:api][:host]} EE_USERNAME=#{node[:expressionengine][:api][:username]} EE_PASSWORD=#{node[:expressionengine][:api][:password]} ./execute_ruby_script one_week_survey_email_sender.rb"
  # end

end
include_recipe 'chef-phishing-frenzy::_ruby'

directory "#{node['chef-phishing-frenzy']['home']}" do
  user 'pf_prod'
  group 'pf_users'
  mode 0755
end

directory "#{node['chef-phishing-frenzy']['home']}/shared" do
  user 'pf_prod'
  group 'pf_users'
  mode 0755
end

directory "#{node['chef-phishing-frenzy']['home']}/shared/bundle" do
  user 'pf_prod'
  group 'pf_users'
  mode 0755
  recursive true
end

deploy_revision node['chef-phishing-frenzy']['home'] do
  repo 'https://github.com/pentestgeek/phishing-frenzy'
  revision 'master'
  user 'pf_prod'
  group 'pf_users'
  migrate true
  migration_command 'bundle exec rake db:migrate'
  environment 'RAILS_ENV' => 'production'
  action :deploy

  symlink_before_migrate({
  })
# THis needs to go somewhere
  # 11:12 <@zeknox> chmod -R 755 /var/www/phishing-frenzy/public/uploads/
    # 11:12 <@zeknox> chown -R www-data:www-data /var/www/phishing-frenzy/

  before_migrate do

    %w(pids log system public).each do |dir|
      directory "#{node['chef-phishing-frenzy']['home']}/shared/#{dir}" do
        mode 0755
        recursive true
      end
    end

    template "#{release_path}/config/database.yml" do
      mode 0755
    end

    execute 'bundle install' do
      cwd release_path
      user 'pf_prod'
      group 'pf_users'
      command "bundle install --without test development --path=#{node['chef-phishing-frenzy']['home']}/shared/bundle"
    end
  end

  before_restart do
    execute 'asset:precompile' do
      user 'pf_prod'
      group 'pf_users'
      environment 'RAILS_ENV' => 'production'
      cwd release_path
      command 'bundle exec rake assets:precompile'
    end
  end

  after_restart do
    execute 'db:seed' do
      user 'pf_prod'
      group 'pf_users'
      environment 'RAILS_ENV' => 'production'
      cwd release_path
      command 'bundle exec rake db:seed'
    end

    execute 'db:templates' do
      user 'pf_prod'
      group 'pf_users'
      environment 'RAILS_ENV' => 'production'
      cwd release_path
      command 'bundle exec rake templates:load'
    end

    execute 'chown-release_path-assets' do
      command "chown -R www-data:www-data #{release_path}/public/assets"
      user 'root'
      action :run
    end
  end
end

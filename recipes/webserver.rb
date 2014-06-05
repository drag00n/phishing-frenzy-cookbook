node.default['apache']['default_site_enabled'] = false

include_recipe "apache2"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.1.2"

include_recipe "passenger_apache2::default"

template "#{node['apache']['dir']}/sites-enabled/pf.conf" do
  source "apache2.conf.erb"
  notifies :restart, 'service[apache2]'
end

apache_site "pf.conf" do
  enable true
  notifies :restart, 'service[apache2]'
end

directory "var/www/phishing-frenzy" do
  action :create
  mode "0755"
  recursive true
end
node.default['apache']['default_site_enabled'] = false

include_recipe "apache2"
include_recipe "apache2::mod_php5"

package "php-mysql" do
  action :install
  notifies :restart, "service[apache2]"
end

template "#{node['apache']['dir']}/sites-enable/pf.conf" do
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
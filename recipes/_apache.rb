include_recipe 'apache2::default'
include_recipe 'passenger_apache2::mod_rails'

# enable custom template
template '/etc/apache2/apache2.conf' do
  source 'apache2.conf.erb'
  owner  'root'
  group  node['apache']['root_group']
  mode   '0644'
end

# enable custom pf.conf
template  '/etc/apache2/pf.conf' do
  source  'pf.conf.erb'
  owner   'root'
  group   node['apache']['root_group']
  mode    '0644'
end

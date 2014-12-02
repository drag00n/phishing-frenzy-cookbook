include_recipe 'mysql::server'
include_recipe 'database::mysql'

mysql_database node['chef-phishing-frenzy']['database']['dbname'] do
  connection(
    :host => node['chef-phishing-frenzy']['database']['host'],
    :username => node['chef-phishing-frenzy']['database']['username'],
    :password => node['chef-phishing-frenzy']['database']['password']
  )
  action :create
end

mysql_database_user node['chef-phishing-frenzy']['database']['app']['username'] do
  connection(
    :host => node['chef-phishing-frenzy']['database']['host'],
    :username => node['chef-phishing-frenzy']['database']['username'],
    :password => node['chef-phishing-frenzy']['database']['password']
  )
  password node['chef-phishing-frenzy']['database']['app']['password']
  database_name node['chef-phishing-frenzy']['database']['dbname']
  privileges [:all]
  host node['chef-phishing-frenzy']['database']['host']
  action [:create, :grant]
end

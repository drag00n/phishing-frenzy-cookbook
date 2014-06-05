#
# Cookbook Name:: phishing-frenzy-cookbook
# Recipe:: database.rb
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
include_recipe "database::mysql"

# Metadata dependency on the database cookbook provides
# access to the mysql_database providers.
mysql_database node['phishing-frenzy']['database']['dbname'] do
  connection(
  	:host => node['phishing-frenzy']['database']['host'],
  	:username => node['phishing-frenzy']['database']['username'],
  	:password => node['phishing-frenzy']['database']['password']
  	)
  action :create
end
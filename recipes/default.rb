#
# Cookbook Name:: chef-phishing-frenzy
# Recipe:: default
#
include_recipe 'apt' if node['platform'] == 'ubuntu'

include_recipe 'build-essential'
include_recipe 'chef-phishing-frenzy::_users'
include_recipe 'chef-phishing-frenzy::mysql'
include_recipe 'chef-phishing-frenzy::_redis'
include_recipe 'chef-phishing-frenzy::_sidekiq'
include_recipe 'git'
include_recipe 'chef-phishing-frenzy::_ruby'
include_recipe 'chef-phishing-frenzy::_apache'
include_recipe 'chef-phishing-frenzy::_application'

#
# Cookbook Name:: phishing-frenzy-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "phishing-frenzy::database"
include_recipe "phishing-frenzy::webserver"
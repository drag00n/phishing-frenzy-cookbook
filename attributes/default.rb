default['servername'] = 'localhost'

default['phishing-frenzy']['database']['host']      = 'localhost'
default['phishing-frenzy']['database']['username']  = 'root'
default['phishing-frenzy']['database']['password']  = node['mysql']['server_root_password']
default['phishing-frenzy']['database']['dbname']    = 'pf-dev'

default['mysql']['server_root_password'] = 'ilikerandompasswords'

default['chef-phishing-frenzy']['database']['host'] = 'localhost'
default['chef-phishing-frenzy']['database']['username'] = 'root'
default['chef-phishing-frenzy']['database']['password'] = node['mysql']['server_root_password']
default['chef-phishing-frenzy']['database']['dbname'] = 'pf_prod'

default['chef-phishing-frenzy']['home'] = '/var/www/phishing-frenzy'
default['chef-phishing-frenzy']['host'] = 'localhost'

default['chef-phishing-frenzy']['database']['app']['username'] = 'pf_prod'
default['chef-phishing-frenzy']['database']['app']['password'] = 'password'

case node['platform']
when 'redhat', 'centos', 'scientific', 'fedora', 'amazon', 'oracle'
    default['chef-phishing-frenzy']['gem']['dep_packages'] = %w{ libxml2 libxml2-devel libxslt libxslt-devel sqlite-devel }
else
    default['chef-phishing-frenzy']['gem']['dep_packages'] = %w{ libxslt-dev libxml2-dev libsqlite3-dev libpq-dev }
end

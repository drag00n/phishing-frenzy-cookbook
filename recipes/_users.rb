group 'pf_users' do
  system true
end

user 'pf_dev' do
  gid 'pf_users'
  system true
  comment 'PF user'
  shell '/bin/bash'
  supports :manage_home => true
end

user 'pf_prod' do
  gid 'pf_users'
  system true
  comment 'PF user'
  shell '/bin/bash'
  supports :manage_home => true
end

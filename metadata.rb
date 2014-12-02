name             'chef-phishing-frenzy'
maintainer       'drag00n'
maintainer_email 'christophermluciano@gmail.com'
license          'All rights reserved'
description      'Installs/Configures chef-phishing-frenzy'
long_description 'Installs/Configures chef-phishing-frenzy'
version          '0.1.0'

%w( apache2 passenger_apache2 mysql database git chef-sugar yum apt build-essential ohai redisio git rubies ).each do |dep|
  depends dep
end

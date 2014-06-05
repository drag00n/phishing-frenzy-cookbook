name             'phishing-frenzy'
maintainer       "Christopher Luciano"
maintainer_email "christophermluciano@gmail.com"
license          "All rights reserved"
description      "Installs/Configures phishing-frenzy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apache2"
depends "apt"
depends "database"
depends "mysql"
depends "passenger_apache2"
depends "rbenv"
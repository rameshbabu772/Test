name             'sinatra'
maintainer       'Ramesh babu'
maintainer_email 'baburame1986@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Sinatra Framework'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

depends          'nginx',   '= 2.7.6'
depends          'unicorn', '= 2.1.0'
depends 'chef-sugar'
depends 'firewall', '~> 2.4.0'
depends 'httpd', '~> 0.3.4'
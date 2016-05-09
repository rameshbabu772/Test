name             'sinatra'
maintainer       'Justin Early'
maintainer_email 'jearly0@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Sinatra Framework'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

depends          'nginx',   '= 2.7.6'
depends          'unicorn', '= 2.1.0'

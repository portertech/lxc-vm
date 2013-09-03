name             'packages'
maintainer       'Sean Porter Consulting'
maintainer_email 'portertech@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apt"
depends "ntp"
depends "ruby_installer"
depends "modules"

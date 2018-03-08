#packages
package { 'apache2':
  ensure => installed,
}

package { 'cifs-utils':
  ensure => installed,
}

package { 'tftpd-hpa':
  ensure => installed,
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => Package['apache2'],
}

#files and directories
file { "/mnt/tempfiles":
  ensure => "directory"
}

file { "/var/www/html/bcld/":
  ensure => "directory",
  require => Package['apache2'],
}

file { "/var/www/html/bcld/vmlinuz":
  ensure => present,
  source => '/home/administrator/git/facet/generic/vmlinuz',
  #require => File['/var/www/html/bcld'],
}

file { "/var/www/html/bcld/initrd":
  ensure => present,
  source => '/home/administrator/git/facet/generic/initrd',
  #require => File['/var/www/html/bcld'],
}


# Ensure Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;
      index index.html index.htm index.nginx-debian.html;

      server_name _;

      location / {
        try_files \$uri \$uri/ =404;
        add_header X-Content-Type-Options nosniff;
      }

      location /redirect_me {
        return 301 https://www.example.com/;
      }

      error_page 404 /404.html;
      location = /404.html {
        root /var/www/html;
        internal;
      }
    }
  ",
  require => Service['nginx'],
}

# Create the index file with "Hello World!"
file { '/var/www/html/index.nginx-debian.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}


# Install Flask version 2.1.0 using pip3
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# Install the required dependencies
package { ['werkzeug']:
  ensure   => 'latest',
  provider => 'pip3',
}

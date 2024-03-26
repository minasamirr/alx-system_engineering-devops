# Kills a process named killmenow
exec { 'pkill':
  path        => '/usr/bin',
  command     => 'pkill -9 -f killmenow',
}

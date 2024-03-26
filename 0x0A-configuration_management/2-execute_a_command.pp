# Kills a process named killmenow
exec { 'kill-killmenow':
  path        => '/usr/bin',
  command     => 'pkill killmenow',
}

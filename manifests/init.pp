# -- Class systemd  
# This module allows triggering systemd commands once for all modules 
class systemd (
  $service_limits = {}
){

  Exec {
    refreshonly => true,
    path        => $::path,
  }

  exec {
    'systemctl-daemon-reload':
      command => 'systemctl daemon-reload',
      onlyif  => '/usr/bin/test -x /bin/systemctl',
  }

  exec {
    'systemd-tmpfiles-create':
      command => 'systemd-tmpfiles --create',
  }

  create_resources('systemd::service_limits', $service_limits, {})

}

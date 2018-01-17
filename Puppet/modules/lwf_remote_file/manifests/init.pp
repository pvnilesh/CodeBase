# == Class: lwf_remote_file
# This class for downloading file from remote server
#
#
# === Parameters
#
# === Examples
#
# === Authors
#
class lwf_remote_file(
  $name,
  $ensure_file = 'present',
  Optional[String] $target_path,
  $source_path,
) {
  
  if $target_path == undef {
    $target_path = $name
  }
  
  remote_file { $name:
    ensure => $ensure_file,
    path   => $target_path, 
    source => $source_path, 
  }
}

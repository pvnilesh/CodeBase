# fetch.pp
# Main class of nexus to fetch the artifatcs from Nexus Repository
#
# fetch maven artifact from Nexus Repository using the custom type 'nexus_artifact'
# Example - 
# class {"fetch_artifact":
#  nexus      => 'https://repository.sonatype.org/nexus'
#  username   => $username, # nexus username
#  password   => $password, # nexus password
#  id         => 'app-runner', # artifact id
#  repo       => 'central',    # nexus repo id
#  group      => "com.danielflower.apprunner", # nexus group
#  classifier => "",
#  ensure     => present,
#  version    => '1.1.1',
#  name       => 'apprunner',
#  extension  => 'jar',
#  owner      => 'apprunner',
#  path       => '/root',
#  mode       => '0644'
#}

class nexus::fetch_artifact (
  $username = 'admin',
  $password = 'admin123',
  $nexus,
  $repo,
  $group,
  $id,
  $version = 'latest',
  $classifier = '',
  $extension = 'war',
  $name,
  $path = '/var/tmp',
  $owner = 'root',
  $mode = '0644',
  $enusre = 'present',
) {  
  
  nexus_artifact { $name:
	nexus      => $nexus,
    username   => $username, 
    password   => $password,
    id         => $id,
    repo       => $repo,
    group      => $group,
    classifier => $classifier,
    ensure     => $ensure,
    version    => $version,
    name       => $name,
    extension  => $extension,
    owner      => $owner,
    path       => $path,
    mode       => $mode,
  }
}

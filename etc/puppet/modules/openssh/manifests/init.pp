
class openssh(  $port           = "22",
                $serverKeyBits  = "2048",
                $syslogFacility = "AUTHPRIV",
                $logLevel       = "VERBOSE",
                $permitRoot     = "no",
                $permitTunnel   = "no",
                $maxAuthTries   = "3",
                $maxSessions    = "5",
                $allowGroups    = "users",
                $sftpGroup      = "sftp",
                $keys_only      = false,
                $addUsers       = [ "vagrant", ],
                $shellsTemplate = "/vagrant/etc/puppet/modules/openssh/templates/shells.erb",
                $template       = "/vagrant/etc/puppet/modules/openssh/templates/sshd_config.erb" ) {

    include openssh::params, openssh::install, openssh::config, openssh::service

}

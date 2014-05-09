/*
 * Quickly Append user to group
 */
define inline_app_group {
    notify { "Adding user ${name} to ACL group ${openssh::allowGroups}": }
    exec   { "/usr/sbin/usermod -a -G ${openssh::allowGroups} ${name}":  }
}

class openssh::config {

    group {

        "SSH ACL GROUP":
            ensure  => present,
            name    => "${openssh::allowGroups}";

        "SFTP ONLY GROUP":
            ensure  => present,
            name    => "${openssh::sftpGroup}",
            require => Group[ "SSH ACL GROUP" ];
    }

    inline_app_group { 
        $openssh::addUsers:
            before  => File[  "SFTP ONLY SHELL"   ],
            require => Group[ "SFTP ONLY GROUP"	  ];
    }

    file {

    	"SFTP ONLY SHELL":
            ensure  => link,
            target  => "$openssh::params::bin_path",
            path    => "/bin/sftp-only"; 

        "UPDATE SHELLS FILE":
	        ensure  => present,
            name    => "/etc/shells",
            owner   => "root",
	        group   => "root",
	        mode    => 0644,
    	    content => template( "$openssh::shellsTemplate" ),
	        require => File[  "SFTP ONLY SHELL"  ];
	
        "SSHD_CONFIG":
            ensure  => present,
            name    => "$openssh::params::cnf_path",
            owner   => "root",
            group   => "root",
            mode    => 0400,
            content => template( "$openssh::template" ), 
            require => File[  "UPDATE SHELLS FILE" ],
            notify  => Class[ "openssh::service"   ];

    }

}

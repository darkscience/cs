
class apache::config {

    # Global Definitions
    Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin" }
    File { owner => 'root', group => 'root' }

    # Prep Apache For Secure Default
    exec {

        "Ensure Apache Halted":
            command => "service apache2 stop",
            require => Class[ "apache::install" ];

        "Disable Default Site":
            command => "a2dissite default",
            require => Exec[ "Ensure Apache Halted" ];

        "Fix Open Directory Permissions":
            command => "find $apache::params::conf_path -type d -print | xargs -n 1 chmod 0701",
            require => Exec[ "Disable Default Site" ];

        "Fix Open Config Permissions":
            command => "find $apache::params::conf_path -type f -print | xargs -n 1 chmod 640",
            require => Exec[ "Fix Open Directory Permissions" ];

    } 

    apache::vhost {
        "default": 
            serverAdmin     => $apache::admin, 
            serverName      => $apache::serverName,
            serverAlias     => "${::hostname}.${apache::serverName}",
            docroot         => $apache::docroot,
            uid             => $apache::uid,
            gid             => $apache::gid,
            options         => $apache::options, 
            vhostTemp       => $apache::vhostTemp, 
            indexTemp       => $apache::indexTemp, 
            port            => "80",
            priority        => "000",
            ssl             => false,
            enabled         => true
    }

    file {

        "Default ServerName":
            ensure  => present,
            path    => "$apache::params::conf_path/conf.d/ServerName",
            mode    => 0640,
            content => "ServerName lolcathost", 
            require => Apache::Vhost[ "default" ],
            notify  => Class[ "apache::service" ];
    }

}

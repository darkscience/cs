/**
 * 
 * Parameters
 * ----------
 *
 * serverName 
 * serverAlias
 * serverAdmin
 * ssl 
 * uid
 * gid
 * port
 * priority
 * docroot
 * options
 * template
 *
 ******/
define apache::vhost( $serverName  = "",
                      $serverAlias = "",
                      $serverAdmin = "",
                      $ssl         = "",
                      $uid         = "",
                      $gid         = "",
                      $port        = "",
                      $priority    = "",
                      $docroot     = "",
                      $options     = "",
                      $enabled     = false, 
                      $vhostTemp   = "",
                      $indexTemp   = "" ) {

    include apache

    user {
        "$uid":
            ensure  => present,
            home    => $docroot,
            shell   => "/bin/bash", 
    }

    group {
        "$gid":
            ensure  => present,
            name    => "$gid",
            require => User[ $uid ]; 
    }

    File { owner => "$uid", group => "$gid" }
    file {

        "DocRoot $docroot":
            ensure  => directory,
            mode    => 0701,
            path    => $docroot, 
            require => Group[ $gid ];

        "DocLog $docroot/log":
            ensure  => directory,
            mode    => 0701,
            path    => "$docroot/log", 
            require => File[ "DocRoot $docroot" ];

        "DocPub $docroot/pub":
            ensure  => directory,
            mode    => 0701,
            path    => "$docroot/pub", 
            require => File[ "DocLog $docroot/log" ];

        "TestIndex $docroot/pub/index.php":
            ensure  => file,
            mode    => 0600,
            path    => "$docroot/pub/index.php",
            content => template( "$indexTemp" ),
            require => File[ "DocPub $docroot/pub" ];

        "Vhost $serverName":
            ensure  => file,
            mode    => 0600,
            path    => "$apache::params::conf_path/sites-available/$title",
            content => template( "$vhostTemp" ),
            require => File[ "TestIndex $docroot/pub/index.php" ];

    }

    if $enabled == true {

        file { "Enable $serverName":
            ensure => link,
            target => "$apache::params::conf_path/sites-available/$title",
            path   => "$apache::params::conf_path/sites-enabled/$priority-$title";
            #notify => Class[ "apache::service" ];
        }

    }

}


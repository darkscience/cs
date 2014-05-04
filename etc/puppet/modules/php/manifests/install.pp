

class php::install {

    Exec { path => "/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin" } 

    package {
        "PHP5":
            ensure => installed,
            name   => "$php::params::pkg_name";

        "PHP-PEAR":
            ensure  => installed,
            name    => "$php::params::pkg_pear",
            require => Package[ "PHP5" ]; 
    }


    if $php::with_composer == true {

        notify { "Composer included, downloading installer from $php::params::composer_uri": }

        exec {
            'Create Composer Phar':
                command => "/usr/bin/curl -sS $php::params::composer_uri | /usr/bin/php", 
                cwd     => "/tmp",
                creates => "/tmp/composer.phar",
                onlyif  => [ "test ! -f $php::params::composer_path", "test ! -f /tmp/composer.phar" ],
                require => Package[ "PHP-PEAR" ];

            "Move Composer Phar":
                command => "mv /tmp/composer.phar $php::params::composer_path", 
                umask   => 0022,
                creates => "/usr/local/bin/composer",
                onlyif  => [ "test ! -f $php::params::composer_path", "test -f /tmp/composer.phar" ],
                require => Exec[ "Create Composer Phar" ];
        }
    } 

}

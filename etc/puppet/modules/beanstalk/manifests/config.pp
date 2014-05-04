class beanstalk::config {

    /****
     * Beanstalk Sandbox
     ********************/
    user {
        "BEANSTALK USER":
            ensure     => present,
            home       => "/usr/local/beanstalkd", 
            name       => "$beanstalk::daemon_user",
            managehome => true,
            system     => true
    }

    group {
        "BEANSTALK GROUP":
            ensure  => present,
            name    => "$beanstalk::daemon_user",
            require => User[ "BEANSTALK USER" ];
    }

    /****
     * Beanstalk Config
     *******************/
    file {
        "BEANSTALK $beanstalk::params::ini_path":
            ensure  => present,
            path    => "$beanstalk::params::cnf_path",
            owner   => "$beanstalk::daemon_user",
            group   => "$beanstalk::daemon_user",
            content => template( "$beanstalk::template" ),
            require => Group[ "BEANSTALK GROUP" ];
    }

}


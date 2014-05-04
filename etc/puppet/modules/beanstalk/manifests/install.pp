
class beanstalk::install {

    package {
        "BEANSTALK DAEMON":
            ensure  => installed,
            name    => $beanstalk::params::pkg_name;
    }

}


class beanstalk::service {

    service {
        "BEANSTALK":
            ensure     => running,
            binary     => "$beanstalk::params::ini_path",
            name       => "$beanstalk::params::svc_name",
            hasrestart => true,
            hasstatus  => true 
    }

}

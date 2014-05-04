
class beanstalk::params {

    case $::osfamily {

        /(Debian)/: {
            $pkg_name = "beanstalkd" 
            $svc_name = "beanstalkd"
            $cnf_path = "/etc/default/beanstalkd"
            $ini_path = "/etc/init.d/beanstalkd"
        }  

    }

}

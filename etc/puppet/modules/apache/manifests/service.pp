
class apache::service {

    service {

        "APACHE-MPM-ITK":
            ensure      => running,
            name        => "$apache::params::svc_name",
            enable      => true,
            hasstatus   => true,
            hasrestart  => true,
            require     => Class[ "apache::config" ];
            
    }
}

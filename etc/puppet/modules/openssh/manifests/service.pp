
class openssh::service {

    service {
        "OPENSSH SERVER":
            ensure     => running,
            name       => "$openssh::params::svc_name",
            enable     => true,
            hasrestart => true,
            hasstatus  => true;
    }

}

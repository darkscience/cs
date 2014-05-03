
class apache::params {

    case $::osfamily {

        /(Debian)/ : {
            $pkg_name  = "apache2-mpm-itk"
            $svc_name  = "apache2"
            $conf_path = "/etc/apache2"
            $vhost_dir = "$conf_path/sites-available"
            $webroot   = "/usr/local/www"
        }

    }
}

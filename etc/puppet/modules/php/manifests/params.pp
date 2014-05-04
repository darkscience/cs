
class php::params {

    case $::osfamily {

        /(Debian)/ : {
            $pkg_name      = "php5"
            $pkg_pear      = "php-pear" 
            $cnf_path      = "/etc/php5/apache2/php.ini"
        }

    }

    $ini_template     = "/vagrant/etc/puppet/modules/php/templates/php.ini.erb"

    /**
     * Composer
     ***********/
    $composer_uri     = "https://getcomposer.org/installer"
    $composer_path    = "/usr/local/bin/composer"

}

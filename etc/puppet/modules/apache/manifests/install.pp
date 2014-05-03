
class apache::install {

    package {
    
        'APACHE':
            name   => $apache::params::pkg_name,
            ensure => latest;

    }
}

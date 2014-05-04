class php::config {

    $max_execution_time = $php::max_execution_time
    $max_input_time     = $php::max_input_time
    $memory_limit       = $php::memory_limit
    $display_errors     = $php::display_errors
    $log_errors         = $php::log_errors
    $error_log          = $php::error_log
    $file_uploads       = $php::file_uploads
    $error_reporting    = $php::error_reporting

    include apache

    file {
        "PHP INI":
            ensure  => present,
            path    => "/etc/php5/apache2/php.ini",
            content => template( "$php::params::ini_template" ),
            notify  => Class[ "apache::service" ]; 
    }

}

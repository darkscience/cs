
class php( 
           $max_execution_time = "30",
           $max_input_time     = "30",
           $memory_limit       = "128M",
           $display_errors     = "Off",
           $log_errors         = "On",
           $error_log          = "syslog",
           $file_uploads       = "On",
           $error_reporting    = "E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR",
           $with_composer      = true ) {

    include php::params, php::install, php::config

}

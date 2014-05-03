
class apache ( $admin        = "",
               $port         = "",
               $serverName   = "",
               $docroot      = "",
               $uid          = "",
               $gid          = "",
               $options      = "",
               $vhostTemp    = "",
               $indexTemp    = "" ) {

    include apache::params, apache::install, apache::config, apache::service

}


#
# Node Template
#
node /^electra$|^andromeda$|^romy$/ {

    stage { [pre, post]: }
    Stage[ 'pre' ] -> Stage[ 'main' ] -> Stage[ 'post' ]

    $local_sites = hiera( 'apache_vhosts', [] ) 

    class { 
        "bootstrap": 
            stage  => 'pre',
            before => Class[ "openssh"    ];

        "openssh":
            stage   => 'pre', 
            require => Class[ "bootstrap" ];

        "apache":
            require => Class[ "openssh"   ]; 

        "php":
            require => Class[ "apache"    ];

        "beanstalk":
            require => Class[ "php"       ];
    }

    /****
     * Local Sites
     **************/
    create_resources( 'apache::vhost', $local_sites )
}

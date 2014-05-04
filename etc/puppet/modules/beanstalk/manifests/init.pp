
class beanstalk ( $persistent  = "yes",
                  $listen_addr = "127.0.0.1",
                  $listen_port = "11300",
                  $daemon_user = "beanstalk",
                  $daemon_opts = '-l $BEANSTALKD_LISTEN_ADDR -p $BEANSTALKD_LISTEN_PORT -u $DAEMON_USER',
                  $template    = "/vagrant/etc/puppet/modules/beanstalk/templates/beanstalkd.erb" ) {

   include beanstalk::params, beanstalk::install, beanstalk::config, beanstalk::service 

}

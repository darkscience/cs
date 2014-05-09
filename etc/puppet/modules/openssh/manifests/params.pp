
class openssh::params {


    case $::osfamily {

        /(Debian)/: {
            $pkg_name = "openssh-server" 
            $svc_name = "ssh"
            $cnf_path = "/etc/ssh/sshd_config"
            $bin_path = "/usr/lib/openssh/sftp-server"
        }
    }
}


class openssh::install {

    package {

        "SSHD SERVER":
            ensure  => latest,
            name    => "$openssh::params::pkg_name";

    }

}

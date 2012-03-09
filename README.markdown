#Rubygem LinuxDistro

##About

As YaST++ (Linux configuration library) is planned to be compatible with several
Linux distributions, this library should provide an information

* On which Linux distribution are we running
* Where are the system directories

##Project Status

Currently just in a 'proof of concept' state

##How Are the Distros Recognized

    /etc/fedora-release         --> Fedora
        -- example ---
        Fedora release 16 (Verne)
        -- example ---

    /etc/SuSE-release           --> SUSE
        -- example ---
        openSUSE 12.1 (x86_64)
        VERSION = 12.1
        CODENAME = Asparagus
        -- example ---

    /etc/centos-release         --> CentOS
        -- example ---
        CentOS release 6.2 (Final)
        -- example ---

    /etc/mandriva-release       --> Mandriva
        -- example ---
        Mandriva Linux release 2011.0 (Official) for x86_64
        -- example ---

    /etc/lsb-release
        -- example ---
        DISTRIB_ID=Ubuntu
        DISTRIB_RELEASE=11.10
        DISTRIB_CODENAME=oneiric
        DISTRIB_DESCRIPTION="Ubuntu 11.10"
        -- example ---          --> Ubuntu

        -- example ---
        DISTRIB_ID=LinuxMint
        DISTRIB_RELEASE=12
        DISTRIB_CODENAME=lisa
        DISTRIB_DESCRIPTION="Linux Mint 12 Lisa"
        -- example ---          --> LinuxMint

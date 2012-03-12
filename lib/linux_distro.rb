require 'ftools'

module LinuxDistro

  D_FEDORA   = 'fedora'
  D_SUSE     = 'suse'
  D_CENTOS   = 'centos'
  D_MANDRIVA = 'mandriva'

  DISTRO_FILES = {
    D_FEDORA    => '/etc/fedora-release',
    D_SUSE      => '/etc/SuSE-release',
    D_CENTOS    => '/etc/centos-release',
    D_MANDRIVA  => '/etc/mandriva-release',
  }

  def self.distro
    init

    @distro
  end

  def self.fedora?
    distro == D_FEDORA
  end

  def self.suse?
    distro == D_SUSE
  end

  def self.centos?
    distro == D_CENTOS
  end

  def self.mandriva?
    distro == D_MANDRIVA
  end

  private

  def self.detect_distro
    # 1.) Simply detect files
    DISTRO_FILES.each do |distro, file|
      return distro if File.exists? file
    end

    raise NotImplementedError, "Your distribution was not recognized"
  end

  def self.init
    @distro = detect_distro unless @initialized
    @initialized = true
  end

  # For testing purpose, module needs to be re-initialized
  def self.reset
    @initialized = false
  end

end

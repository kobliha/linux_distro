require 'test/unit'
require 'linux_distro'
require 'ftools'
require 'rubygems'

class LinuxDistroTest < Test::Unit::TestCase
  def teardown
    LinuxDistro::send :reset
  end

  ### HELPER METHODS ###

  CHROOT_DATA_DIR = File.join(File.dirname(__FILE__), 'data')

  # Consists of pairs
  #   distro : path_to_chroot (data needed to recognize the distro)
  KNOWN_DISTROS = {
    LinuxDistro::D_FEDORA      => File.join(CHROOT_DATA_DIR, 'Fedora/16'),
    LinuxDistro::D_SUSE        => File.join(CHROOT_DATA_DIR, 'openSUSE/12.1'),
    LinuxDistro::D_CENTOS      => File.join(CHROOT_DATA_DIR, 'CentOS/6.2'),
    LinuxDistro::D_MANDRIVA    => File.join(CHROOT_DATA_DIR, 'Mandriva/2011.0'),
  }

  def set_distro (distro)
    unless KNOWN_DISTROS[distro]
      # Unknown distribution
      raise NotImplementedError, "Your distribution '#{distro}' is unknown to this testcase"
    end

    LinuxDistro::chroot = KNOWN_DISTROS[distro]
  end

  ### TESTS ###

  def test_fedora?
    set_distro LinuxDistro::D_FEDORA

    assert LinuxDistro::fedora?, "Should return true: #{LinuxDistro::fedora?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_suse?
    set_distro LinuxDistro::D_SUSE

    assert LinuxDistro::suse?, "Should return true: #{LinuxDistro::suse?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_centos?
    set_distro LinuxDistro::D_CENTOS

    assert LinuxDistro::centos?, "Should return true: #{LinuxDistro::centos?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_mandriva?
    set_distro LinuxDistro::D_MANDRIVA

    assert LinuxDistro::mandriva?, "Should return true: #{LinuxDistro::mandriva?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_distro
    KNOWN_DISTROS.each do |distro, chroot_dir|
      set_distro distro

      assert_equal distro, LinuxDistro::distro, "Should return #{distro}, Distro is: #{LinuxDistro::distro}"
    end
  end

end

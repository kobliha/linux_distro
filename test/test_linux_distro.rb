require 'test/unit'
require 'linux_distro'
require 'ftools'
require 'rubygems'
require 'mocha'

class LinuxDistroTest < Test::Unit::TestCase
  def teardown
    Mocha::Mockery.instance.stubba.unstub_all
    LinuxDistro::send :reset
  end

  ### HELPER METHODS ###

  FILE_METHOD_DISTROS = [
    LinuxDistro::D_FEDORA,
    LinuxDistro::D_SUSE,
    LinuxDistro::D_CENTOS,
    LinuxDistro::D_MANDRIVA,
  ]

  ALL_DISTROS = FILE_METHOD_DISTROS

  def set_distro (distro)
    if FILE_METHOD_DISTROS.include?(distro)
      distro_file = LinuxDistro::DISTRO_FILES[distro]
      File.stubs(:exists?).with(anything).returns(false)
      File.stubs(:exists?).with(distro_file).returns(true)
      # setup is finished
      return
    end

    # Unknown distribution
    raise NotImplementedError, "Your distribution '#{distro}' is unknown to this testcase"
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
    ALL_DISTROS.each do |distro|
      set_distro distro
      assert_equal distro, LinuxDistro::distro, "Should return #{distro}, Distro is: #{LinuxDistro::distro}"
      # Needed for LinuxDistro to reinitialize
      teardown
    end
  end

end

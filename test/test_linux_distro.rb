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

  FILE_METHOD_DISTROS = {
    'fedora'    => LinuxDistro::D_FEDORA,
    'suse'      => LinuxDistro::D_SUSE,
    'centos'    => LinuxDistro::D_CENTOS,
    'mandriva'  => LinuxDistro::D_MANDRIVA,
  }

  def set_distro (distro)
    unless FILE_METHOD_DISTROS[distro].nil?
      distro_file = LinuxDistro::DISTRO_FILES[FILE_METHOD_DISTROS[distro]]
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
    set_distro 'fedora'

    assert LinuxDistro::fedora?, "Should return true: #{LinuxDistro::fedora?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_suse?
    set_distro 'suse'

    assert LinuxDistro::suse?, "Should return true: #{LinuxDistro::suse?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_centos?
    set_distro 'centos'

    assert LinuxDistro::centos?, "Should return true: #{LinuxDistro::centos?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_mandriva?
    set_distro 'mandriva'

    assert LinuxDistro::mandriva?, "Should return true: #{LinuxDistro::mandriva?}, Distro is: #{LinuxDistro::distro}"
  end

  def test_distro
    ['fedora', 'suse', 'centos', 'mandriva'].each do |distro|
      set_distro distro
      assert_equal distro, LinuxDistro::distro, "Should return #{distro}, Distro is: #{LinuxDistro::distro}"
      # Needed for LinuxDistro to reinitialize
      teardown
    end
  end

end

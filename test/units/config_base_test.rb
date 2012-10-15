require 'test_helper'
require 'mysqltopostgres'
require 'yaml'

#
#
class ConfigBaseTest < MiniTest::Unit::TestCase
  attr_reader :config, :configfilepath
  
  def setup
    @configfilepath="#{File.dirname(__FILE__)}/../fixtures/config_all_options.yml"
    config_file = YAML::load(File.read(configfilepath))
    @config = Mysql2psql::ConfigBase.new( config_file )
  end
  
  def teardown
    @config = nil
  end
    
  def test_config_loaded
    assert !(config.config.nil?), "Config is nil"
    # assert_equal configfilepath,config.filepath
  end

  def test_uninitialized_error_when_not_found_and_no_default
    assert_raises(Mysql2psql::UninitializedValueError) do
      value = @config.not_found(:none)
    end
  end
  
  def test_default_when_not_found
    expected = 'defaultvalue'
    value = @config.not_found(expected)
    assert_equal expected,value
  end
  
  def test_mysql_hostname
    value = @config.mysqlhostname
    assert_equal 'localhost',value
  end

  def test_mysql_hostname_array_access
    value = @config[:mysqlhostname]
    assert_equal 'localhost',value
  end
  
  def test_dest_file
    value = @config.destfile
    assert_equal 'somefile',value
  end

end

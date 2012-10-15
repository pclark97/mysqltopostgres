require 'test_helper'

require 'mysqltopostgres'

class PostgresFileWriterTest < MiniTest::Unit::TestCase
  attr_accessor :destfile
  def setup
    begin
      f = Tempfile.new('mysql2psql_test_destfile')
      @destfile = f.path
      f.close!()
    rescue => e
      raise StandardError.new("Failed to initialize integration test db. See README for setup requirements.")
    end
  end
  def teardown
    File.delete(destfile) if File.exists?(destfile)
  end
  
  def test_basic_write
    writer = Mysql2psql::PostgresFileWriter.new(destfile)
    writer.close
    content = IO.read(destfile)
    assert_equal false, content.match("SET client_encoding = 'UTF8'").nil?
    assert_nil content.match("unobtanium")
  end
  

end
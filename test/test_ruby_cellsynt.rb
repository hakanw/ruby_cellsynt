require "minitest/autorun"
require 'ruby_cellsynt'

class CellsyntTest < MiniTest::Unit::TestCase
  def test_version_exists
    assert_instance_of String, RubyCellsynt::VERSION
  end

  def test_simple_send
    assert_equal(1, RubyCellsynt.send_message(
      phone_numbers: ["0046735701385"], 
      from_name: "Testname", 
      text: "Just testing",
      username: "foo",
      password: "bar",
      mock: true # important for testing
    ).length)
  end

  def test_multiple_recipient_send
    assert_equal(2, RubyCellsynt.send_message(
      phone_numbers: ["0046735701385", "0046735701385"], 
      from_name: "Testname", 
      text: "Just testing",
      username: "foo",
      password: "bar",
      mock: true # important for testing
    ).length)
  end

  def test_too_long_name
    assert_raises(RuntimeError) do 
      RubyCellsynt.send_message(
        phone_numbers: ["0046735701385"], 
        from_name: "This name is too long", 
        text: "Just testing",
        username: "foo",
        password: "bar",
        mock: true # important for testing
      )
    end
  end
end
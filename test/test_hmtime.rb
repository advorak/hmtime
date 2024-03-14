# frozen_string_literal: true

require "test_helper"

class TestHMTime < Minitest::Test
  def setup
    @hmtime = HMTime.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::HMTime::VERSION
  end

  def test_it_initializes_with_no_arguments
    assert_equal @hmtime, HMTime.new, "New HMTime objects should be equal"
  end

  def test_it_initializes_with_zero_or_empty_string
    assert_equal @hmtime, HMTime.new(0), "New HMTime objects should not be equal"
    assert_raises(HMTime::ArgumentError, "New HMTime objects should not be equal") { HMTime.new('0') }
    assert_equal @hmtime, HMTime.new('0:00'), "New HMTime objects should not be equal"
    assert_equal @hmtime, HMTime.new(''), "New HMTime objects should not be equal"
  end

  def test_non_hmtime_objects_are_not_equal
    refute_equal @hmtime, 0, "New HMTime objects should not be equal to 0"
    refute_equal @hmtime, 1, "New HMTime objects should not be equal to 1"
    refute_equal @hmtime, '0', "New HMTime objects should not be equal to '0'"
    refute_equal @hmtime, '1', "New HMTime objects should not be equal to '1'"
    refute_equal @hmtime, '0:00', "New HMTime objects should not be equal to '0:00'"
    refute_equal @hmtime, '0:01', "New HMTime objects should not be equal to '0:01'"
    refute_equal @hmtime, 'random string', "New HMTime objects should not be equal to 'random string'"
    refute_equal @hmtime, nil, "New HMTime objects should not be equal to nil"
    refute_equal @hmtime, Hash, "New HMTime objects should not be equal to Hash" # Random example we definitely don't expect.
  end

  def test_negativity_of_hours_and_minutes_of_hmtime
    assert_equal 0, HMTime.new(0).hours, "HMTime objects should have 0 hours"
    assert_equal 0, HMTime.new(0).minutes, "HMTime objects should have 0 minutes"
    assert_equal 1, HMTime.new(61).hours, "HMTime objects should have 1 hour"
    assert_equal 1, HMTime.new(61).minutes, "HMTime objects should have 1 minute"
    assert_equal 0, HMTime.new(-1).hours, "HMTime objects should have 1 hour"
    assert_equal (-1), HMTime.new(-61).hours, "HMTime objects should have 1 hour"
    assert_equal (-1), HMTime.new(-61).minutes, "HMTime objects should have 1 minute"
  end
  
  # assert_equal @hmtime, HMTime.new(''), "New HMTime objects should not be equal"
  def test_hmtime_hours_and_minutes_are_correct
    assert_equal 1, HMTime.new(62).hours, "HMTime objects should have 1 hour"
    assert_equal 2, HMTime.new(62).minutes, "HMTime objects should have 1 minute"
  end

  def test_hmtime_to_s
    assert_equal "1:02", HMTime.new(62).to_s, "HMTime objects should have a string representation of '1:02'"
    assert_equal "-1:02", HMTime.new(-62).to_s, "HMTime objects should have a string representation of '-1:02'"
  end

  def test_string_to_hmtime
    assert_equal HMTime.new(62), '1:02'.to_hmtime, "HMTime objects should be equal"
    assert_equal HMTime.new(-62), '-1:02'.to_hmtime, "HMTime objects should be equal"
  end

  def test_hmtime_to_i
    hmtime = HMTime.new(62)
    assert_equal 62, hmtime.to_i, "HMTime objects should have an integer representation of 62"
  end

  def test_hmtime_addition
    hmtime = HMTime.new(62)
    assert_equal HMTime.new(124), hmtime + hmtime, "HMTime addition should be 124"
    assert_equal HMTime.new(93), hmtime + 31, "HMTime addition should be 93"
    assert_equal HMTime.new(124), hmtime + '1:02', "HMTime addition should be 62"
  end

  def test_hmtime_subtraction
    hmtime = HMTime.new(62)
    assert_equal HMTime.new(0), hmtime - hmtime, "HMTime subtraction should be 0"
    assert_equal HMTime.new(31), hmtime - 31, "HMTime subtraction should be 31"
    assert_equal HMTime.new(0), hmtime - '1:02', "HMTime subtraction should be 0"
    assert_equal HMTime.new(-62), hmtime - hmtime - hmtime, "HMTime subtraction should be -62"
  end

  def test_subtract_negative_hmtime
    hmtime = HMTime.new(62)
    assert_equal HMTime.new(124), hmtime - -hmtime, "HMTime subtraction should be 124"
  end

  def test_has_no_multiply_method
    refute_respond_to @hmtime, :*
  end

  def test_has_no_divide_method
    refute_respond_to @hmtime, :/
  end
end
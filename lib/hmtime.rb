# frozen_string_literal: true

require_relative 'hmtime/version'
require_relative 'hmtime/string'

class HMTime
  class Error < StandardError; end
  class ArgumentError < Error; end
  class TypeError < Error; end
  
  ERROR_MESSAGE_1 = 'Must specify String in format of: `hhh:mm`, where h=Hours and m=Minutes; or integer in the form of #####'

  def initialize(value=0)
    @minutes = check_arguments(value)
  end
  
  def inspect
    time
  end
  
  def hours
    (@minutes.negative? ? -1 : 1) * (@minutes.abs / 60)
  end
  
  def minutes
    (@minutes.negative? ? -1 : 1) * (@minutes.abs % 60)
  end
  
  def to_s
    time
  end
  
  def to_i
    @minutes
  end
  
  def +(value)
    if value.is_a?(self.class)
      self.class.new(@minutes + value.to_i)
    else
      self.class.new(@minutes + check_arguments(value))
    end
  end
  
  def -(value)
    if value.is_a?(self.class)
      self.class.new(@minutes - value.to_i)
    else
      self.class.new(@minutes - check_arguments(value))
    end
  end
  
  # def /(value)
  #   if value.is_a?(self.class)
  #     self.class.new(@minutes / value.to_i)
  #   else
  #     self.class.new(@minutes / check_arguments(value))
  #   end
  # end
  
  # # BUG: Doesn't work if value < 0
  # def *(value)
  #   if value.is_a?(self.class)
  #     self.class.new(@minutes * value.to_i)
  #   else
  #     self.class.new(@minutes * check_arguments(value))
  #   end
  # end
  
  def ==(value)
      value.is_a?(HMTime) && @minutes == value.to_i
  end
  
  # For Comparison
  def <=>(value)
    if @minutes < value.to_i
      -1
    elsif @minutes > value.to_i
      1
    elsif @minutes == value.to_i
      0
    end
  end
  
  def -@
    self.class.new(-@minutes)
  end
  
  private
  
  def time
    my_time = [hours.abs, minutes.abs.to_s.rjust(2,"0")].join(":")
    if @minutes < 0
      "-" + my_time
    else
      my_time
    end
  end
  
  def check_arguments(value)
    if(value.is_a?(Integer))
      arguments = ['', value / 60, value % 60]
    elsif (!value.is_a?(String))
      raise TypeError, ERROR_MESSAGE_1

    # Is the argument a string of format ("hhh:mm" or " ".strip.empty?)?  If not, raise an error.
    elsif !value.strip.empty? && !(arguments = value.strip.match(/^(-?)(\d+|\s+)?:(\d{2})$/).to_a[1..3])
      raise ArgumentError, ERROR_MESSAGE_1
    elsif value.strip.empty?
      arguments = ['',0,0]
    end

    is_negative = arguments[0] == '-'
    hours, minutes = arguments[1,2].collect{|arg| arg.to_i}

    ### How to do a warning??  Is this correct?
    if minutes.to_i > 59
      warn "Warning: The mm (minutes) field of `hhh:mm` should be no greater than 59."
    end

    
    return (is_negative ? -1 : 1) * ((hours * 60) + minutes)
  end
end

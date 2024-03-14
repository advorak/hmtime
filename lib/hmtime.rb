class String
  def to_hmtime
    HMTime.new self
  end
end

class HMTime
  ERROR_MESSAGE_1 = 'Must specify String in format of: `hhh:mm`, where h=Hours and m=Minutes; or integer in the form of #####'

  def initialize(value=0)
    @minutes = check_arguments(value)
  end
  
  def inspect
    time
  end
  
  def hours
    @minutes.abs / 60
  end
  
  def minutes
    @minutes.abs % 60
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
  
  # BUG: Doesn't work if value < 0
  def -(value)
    if value.is_a?(self.class)
      self.class.new(@minutes - value.to_i)
    else
      self.class.new(@minutes - check_arguments(value))
    end
  end
  
  def /(value)
    if value.is_a?(self.class)
      self.class.new(@minutes / value.to_i)
    else
      self.class.new(@minutes / check_arguments(value))
    end
  end
  
  
  # BUG: Doesn't work if value < 0
  def *(value)
    if value.is_a?(self.class)
      self.class.new(@minutes * value.to_i)
    else
      self.class.new(@minutes * check_arguments(value))
    end
  end
  
  def ==(value)
      @minutes == value.to_i
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
    my_time = [hours, minutes.to_s.rjust(2,"0")].join(":")
    if @minutes < 0
      "-" + my_time
    else
      my_time
    end
  end
  
  def check_arguments(value)
    if(value == nil)
      value
    else
      if(value.is_a?(Integer))
        arguments = [value / 60, value % 60]
      elsif (!value.is_a?(String))
        raise TypeError, ERROR_MESSAGE_1

      # Is the argument a string of format ("hhh:mm" or " ".strip.empty?)?  If not, raise an error.
      elsif !value.strip.empty? && !(arguments = value.strip.match(/^(\d+|\s+)?:(\d{2})$/).to_a[1..2])
        raise ArgumentError, ERROR_MESSAGE_1
      elsif value.strip.empty?
        arguments = [0,0]
      end

      ### How to do a warning??  Is this correct?
      if arguments[1].to_i > 59
        warn "Warning: The mm (minutes) field of `hhh:mm` should be no greater than 59."
      end
      hours, minutes = arguments.collect{|arg| arg.to_i}
      return (hours * 60) + minutes
    end
  end
end

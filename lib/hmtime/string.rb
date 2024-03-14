# frozen_string_literal: true

class String
  def to_hmtime
    HMTime.new self
  end
end

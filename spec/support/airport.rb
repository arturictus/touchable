class Airport < ModelTemplate
  include Touchable::Base
  touchables :flights
  # has_many :flights

  def flights
    [Flight.new, Flight.new]
  end
end

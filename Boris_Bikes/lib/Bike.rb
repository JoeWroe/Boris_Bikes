class Bike

  attr_writer :broken
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @working = false
  end

 def broken?
   return false if @working
   return true unless @working
 end

end

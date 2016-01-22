class Bike

  attr_writer :broken

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end

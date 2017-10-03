class Oystercard
  attr_reader :balance
  MAX_BAL = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Sorry, £90 is the limit!' if @balance + amount > MAX_BAL
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  attr_accessor :in_journey

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end

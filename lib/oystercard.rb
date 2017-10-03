class Oystercard
  attr_reader :balance
  MAX_BAL = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'Sorry, £90 is the limit!' if @balance + amount > MAX_BAL
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    false
  end

  def touch_in
    true 
  end

end

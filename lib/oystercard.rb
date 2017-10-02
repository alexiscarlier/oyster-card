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
end

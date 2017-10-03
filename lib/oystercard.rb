class Oystercard
  attr_reader :balance, :fare, :entry_station
  MAX_BAL = 90
  MIN_BAL = 1

  def initialize
    @balance = 0
    @in_journey = false
    @fare = 1
    @entry_station = nil
  end

  def top_up(amount)
    raise 'Sorry, £90 is the limit!' if @balance + amount > MAX_BAL
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(entry_station)
    # allow(:touch_in).to receive(:entry_station).and_return entry_station
    fail "insufficient funds" if @balance < MIN_BAL
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    @in_journey = false
    @balance -= @fare
    @entry_station = nil 
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

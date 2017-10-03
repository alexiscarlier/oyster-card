class Oystercard
  attr_reader :balance, :fare, :entry_station, :exit_station
  MAX_BAL = 90
  MIN_BAL = 1

  def initialize
    @balance = 0
    @fare = 1
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    raise 'Sorry, £90 is the limit!' if @balance + amount > MAX_BAL
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    fail "insufficient funds" if @balance < MIN_BAL
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @balance -= @fare
    @entry_station = nil
    @exit_station = exit_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

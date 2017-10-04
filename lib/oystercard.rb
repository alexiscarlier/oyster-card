class Oystercard
  attr_reader :balance, :fare, :entry_station, :exit_station, :journeys
  MAX_BAL = 90
  MIN_BAL = 1

  def initialize
    @balance = 0
    @fare = 1
    @entry_station = nil
    @exit_station = nil
    @journeys = []
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
    @exit_station = exit_station
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

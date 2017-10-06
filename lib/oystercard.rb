require 'journey'

class Oystercard
  attr_reader :balance, :fare #journey, journeys, in_journey

  MAX_BAL = 90
  MIN_BAL = 1

  def initialize
    @balance = 0
    @fare = 1
    # @journey = {}
    # @journeys = []
    # @in_journey = false
    @touched_in = false
    @touched_out = false
  end

  def top_up(amount)
    raise 'Sorry, £90 is the limit!' if balance + amount > MAX_BAL
    @balance += amount
  end

  def touch_in(entry_station)
    # @in_journey = true
    fail "insufficient funds" if balance < MIN_BAL
    # journey[:entry_station] = entry_station
    @touched_in = true
  end

  def touch_out(exit_station)
    @balance -= @fare
    # journey[:exit_station] = exit_station
    # journeys << journey
    # @in_journey = false
    @touched_in = false
    @touched_out = true
  end

  def charge_penalty_fare?(journey)
    @fare = 6 if journey.journey_complete? && @touched_in
  end

  private




  def deduct(fare)
    @balance -= fare
  end

end

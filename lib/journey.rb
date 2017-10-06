class Journey


  attr_reader :journeys, :journey_history


#   def start_journey
#   end
#
#   def end_journey
#   end
#
#   def calculate_fare
#   end
#
#   def penalty
#   end
#
#   def journey_complete?
#   end
#
# end

  def initialize
    @journey_history = {}
    @journeys = []
    @in_journey = false
    @journey_complete = false
  end

  def in_journey?
    @in_journey
  end

  def start_journey(entry_station)
    @in_journey = true
    @journey_complete = false
    journey_history[:entry_station] = entry_station
  end

  def end_journey(exit_station)
    @in_journey = false
    @journey_complete = true
    journey_history[:exit_station] = exit_station
    journeys << journey_history
  end

  def journey_complete?
    @journey_complete
  end

end

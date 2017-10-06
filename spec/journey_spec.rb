
require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station)}
  # let(:journeys) { {entry_station: entry_station, exit_station: exit_station}}

  it 'records the start of a journey in a hash' do
    journey.start_journey(entry_station)
    expect(journey.journey_history).to eq({entry_station: entry_station})
  end

  it 'records the end of a journey in a hash' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station)
    expect(journey.journeys).to include ({entry_station: entry_station, exit_station: exit_station})
  end

  it 'is not in journey by default' do
    expect(journey).not_to be_in_journey
  end

  it 'is in journey after starting journey' do
    journey.start_journey(entry_station)
    expect(journey).to be_in_journey
  end

  it 'is not in journey after ending journey' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station)
    expect(journey).not_to be_in_journey
  end

  it 'knows if a journey has been completed' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station)
    expect(journey.journey_complete?).to eq true
  end

end

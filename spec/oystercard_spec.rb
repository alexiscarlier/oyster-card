require './lib/oystercard'


describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }
  let(:journey) { double(:journey) }
  # let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end
  it 'allows an oyster card to be topped up by an amount' do
    expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
  end

  it 'raises and error if top up exceeds max' do
    oystercard.top_up(Oystercard::MAX_BAL)
    expect { oystercard.top_up(1) }.to raise_error 'Sorry, £90 is the limit!'
  end


  # it 'is initially not in a journey' do
  #   expect(oystercard.in_journey).to eq false
  # end

  context 'topped up and touched in' do
    before do
      oystercard.top_up(Oystercard::MIN_BAL)
      oystercard.touch_in(entry_station)
    end
      # it 'is in journey if you have touched in by minimum balance' do
      #   expect(oystercard.in_journey).to eq true
      # end
      #
      # it 'is out of journey if you touch out' do
      #   oystercard.touch_out(exit_station)
      #   expect(oystercard.in_journey).to eq false
      # end

      it 'deducts fare as you touch out' do
        expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by -Oystercard::MIN_BAL
      end

     it 'charges a normal fare by default' do
       oystercard.touch_out(exit_station)
       expect(oystercard.fare).to eq Oystercard::NORMAL_FARE
    end
      # it 'remembers the entry station after the touch in' do
      #    expect(oystercard.journey).to eq({:entry_station => entry_station})
      # end
      #
      # it 'remembers the exit station after the touch out' do
      #   oystercard.touch_out(exit_station)
      #
      #   expect(oystercard.journeys).to eq([{:entry_station => entry_station, :exit_station => exit_station}])
      # end

      # it 'creates a journey hash with the entry station as key' do
      #   oystercard.touch_out(exit_station)
      #   expect(oystercard.journeys).to include journey
      # end
        it 'charges a penalty fare if you complete your journey but do not touch out' do
          allow(journey).to receive(:journey_complete?).and_return true
          oystercard.charge_penalty_fare?(journey)
          # allow(journey).to receive(:in_journey?).and_return false
          expect(oystercard.fare).to eq Oystercard::PENALTY_FARE
        end
  end

  it 'does not allow touch_in when balance is < 1' do
    expect {oystercard.touch_in(entry_station) }.to raise_error "insufficient funds"
  end

  # it 'expects the list of journeys to be empty by default' do
  #   expect(oystercard.journeys).to be_empty
  # end




end

require './lib/oystercard'


describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  let(:entry_station) { double(station_name: "Kings Cross") }
  # entry_station = "Kings Cross"

  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'allows an oyster card to be topped up by an amount' do
    expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
  end

  it 'raises and error if top up exceeds max' do
    # max_bal = Oystercard::MAX_BAL
    oystercard.top_up(Oystercard::MAX_BAL)
    expect { oystercard.top_up(1) }.to raise_error 'Sorry, £90 is the limit!'
  end

  # it 'gets deduted by the amount of the fare' do
  #   expect { oystercard.deduct(1) }.to change { oystercard.balance }.by -1
  # end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'is in journey if you have touched in' do
    oystercard.top_up(Oystercard::MIN_BAL)
    oystercard.touch_in(entry_station)
    expect(oystercard).to be_in_journey
  end

  it 'is out of journey if you touch out' do
    oystercard.top_up(Oystercard::MIN_BAL)
    oystercard.touch_in(entry_station)
    p oystercard.entry_station
    p oystercard.entry_station.station_name
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end

  it 'does not allow touch_in when balance is < 1' do
    expect {oystercard.touch_in(entry_station) }.to raise_error "insufficient funds"
  end

  it 'deducts fare as you touch out' do
    oystercard.top_up(10)
    oystercard.touch_in(entry_station)
    expect { oystercard.touch_out }.to change { oystercard.balance }.by -Oystercard::MIN_BAL
  end

  it 'remembers the entry station after the touch in' do
     oystercard.top_up(10)
     oystercard.touch_in(entry_station)
     expect(oystercard.entry_station).to eq entry_station
  end


  # allow(weather).to receive(:stormy).and_return true
  # #   expect { subject.take_off(plane) }.to raise_error "Too stormy!"
  # # end

end

require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'allows an oyster card to be topped up by an amount' do
    expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
  end

  it 'raises and error if top up exceeds max' do
    max_bal = Oystercard::MAX_BAL
    oystercard.top_up(max_bal)
    expect { oystercard.top_up(1) }.to raise_error 'Sorry, £90 is the limit!'
  end
end

require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'allows an oyster card to be topped up by an amount' do
    expect{ oystercard.top_up(1) }.to change { oystercard.balance }.by 1
  end
end

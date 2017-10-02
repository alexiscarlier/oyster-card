require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end
end

require './lib/station'



describe Station do
  subject(:station) { Station.new }
  
  it 'expects a station to have a zone' do
    expect(station.zone).to eq "zone"
  end

  it 'expects a station to have a name' do
    expect(station.name).to eq "name"
  end
end

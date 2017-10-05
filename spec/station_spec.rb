require './lib/station'

describe Station do
  it 'expects a station to have a zone' do
    expect(subject.zone).to eq "zone"
  end

  it 'expects a station to have a name' do
    expect(subject.name).to eq "name"
  end
end

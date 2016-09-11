require 'spec_helper'

describe Airport do
  it_behaves_like 'Touchable'
  it { is_expected.to have_touchable :flights }

  describe 'touches flight' do
    let(:airport) { Airport.new }
    let(:flight) { Flight.new }
    before do
      allow(airport).to receive(:flights).and_return([flight])
    end
    it { expect{ airport.update }.to touch(flight) }
  end
end

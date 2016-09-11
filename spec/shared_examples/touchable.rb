shared_examples 'Touchable' do
  it { expect(described_class).to respond_to :touchables }
  it { is_expected.to respond_to(:cascading_touch) }
  it { expect{ subject.cascading_touch }.not_to raise_error }

  described_class._touchables.each do |touchable|
    if touchable.respond_to? :each
      touchable.each do |elem|
        elem_touching_test(elem)
      end
    else
      elem_touching_test(touchable)
    end
  end
end

def elem_touching_test(elem)
  return unless elem.respond_to?(:touch)
  it "#{elem.class} receives :touch" do
    fail
    expect(elem).to receive(:touch)
    subject.cascading_touch
  end
end

require 'Bike'

describe Bike do
  it { should respond_to(:working?) }

  it 'expects to see if bike is broken' do
    subject.report_broken #GUARD CONDITION
    expect(subject).to be_broken
  end

end

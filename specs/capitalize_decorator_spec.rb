require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable_mock) { double('Nameable') }
  subject { CapitalizeDecorator.new(nameable_mock) }

  describe '#correct_name' do
    it 'capitalizes the name using super' do
      allow(nameable_mock).to receive(:correct_name).and_return('john')
      expect(subject.correct_name).to eq('John')
    end
  end
end

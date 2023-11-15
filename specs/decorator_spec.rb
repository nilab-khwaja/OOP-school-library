require_relative '../decorator'

describe Decorator do
  let(:nameable_mock) { double('Nameable') }
  subject { Decorator.new(nameable_mock) }

  describe '#correct_name' do
    it 'delegates correct_name to the wrapped Nameable object' do
      expect(nameable_mock).to receive(:correct_name)
      subject.correct_name
    end
  end
end

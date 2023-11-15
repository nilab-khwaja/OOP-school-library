require_relative '../nameable'
require_relative '../person'

describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe Person do
  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, 'Alice')
      expect(person.correct_name).to eq('Alice')
    end
  end
end

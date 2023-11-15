require_relative '../person'

describe Person do
  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(25)

      result = person.can_use_services?

      expect(result).to be true
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(16, 'John', parent_permission: true)

      result = person.can_use_services?

      expect(result).to be true
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, 'Alice')

      result = person.correct_name

      expect(result).to eq('Alice')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      person = Person.new(30)
      rental = double('Rental')

      person.add_rental(rental)

      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the person' do
      person = Person.new(22, 'Bob')
      json_result = '{"id":' + person.id.to_s + ',"name":"Bob","age":22,"class":"Person"}'

      result = person.to_json

      expect(result).to eq(json_result)
    end
  end
end

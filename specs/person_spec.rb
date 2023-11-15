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
end

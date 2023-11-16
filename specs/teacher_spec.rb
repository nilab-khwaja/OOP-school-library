require_relative '../teacher'

describe Teacher do
  describe '#can_use_services' do
    it 'returns true' do
      teacher = Teacher.new(30, 'Math', 'John Doe')
      expect(teacher.can_use_services).to eq(true)
    end
  end
end

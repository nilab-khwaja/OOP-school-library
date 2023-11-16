require_relative '../student'

describe Student do
  describe '#assign_to_classroom' do
    it 'adds the student to the classroom' do
      student = Student.new(15, true, 'Alice')
      classroom = double('classroom')

      allow(classroom).to receive(:add_student)
      student.assign_to_classroom(classroom)

      expect(classroom).to have_received(:add_student).with(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a shrugging emoticon' do
      student = Student.new(16, true, 'Bob')
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end

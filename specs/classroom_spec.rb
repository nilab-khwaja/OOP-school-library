require_relative '../classroom'
require_relative '../person'
require_relative '../student'

describe Classroom do
  let(:classroom_label) { "Room 101" }
  let(:student1) { Student.new(15, true, 'John') }
  let(:student2) { Student.new(16, true, 'Jane') }

  subject(:classroom) { described_class.new(classroom_label) }

  it 'adds a student to the classroom' do
    classroom.add_student(student1)
    expect(classroom.students).to include(student1)
  end

  it 'sets the classroom for the added student' do
    classroom.add_student(student2)
    expect(student2.classroom).to eq(classroom)
  end
end

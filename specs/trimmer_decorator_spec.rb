require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:decorated_object) { double('decorated_object', correct_name: 'HelloWorld123') }
  subject { TrimmerDecorator.new(decorated_object) }

  describe '#correct_name' do
    it 'trims the name to the first 10 characters' do
      expect(subject.correct_name).to eq('HelloWorld')
    end
  end
end

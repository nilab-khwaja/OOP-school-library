require_relative '../book'
require_relative '../rental'

describe Book do
  describe '#add_rental' do
    it 'adds a rental to the book and person' do
      person = double('Person')
      allow(person).to receive(:add_rental)
      book = Book.new('Title', 'Author')
      date = '2023-01-01'

      book.add_rental(person, date)

      expect(book.rentals).not_to be_empty
      expect(person).to have_received(:add_rental).with(an_instance_of(Rental))
    end
  end

end

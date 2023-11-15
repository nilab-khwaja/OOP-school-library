require_relative '../book'
require_relative '../rental'

describe Book do
  describe '#initialize' do
    it 'initializes a book with title, author, and an empty rentals array' do
      book = Book.new('Title', 'Author')

      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
      expect(book.rentals).to be_empty
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      book = Book.new('Title', 'Author')
      json_result = book.to_json

      expect(json_result).to be_a(String)
      expect(JSON.parse(json_result)).to eq({ 'title' => 'Title', 'author' => 'Author' })
    end
  end

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

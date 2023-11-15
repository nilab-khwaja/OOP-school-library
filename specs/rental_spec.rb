require 'date'
require_relative '../rental'
require_relative '../book'
require_relative '../person'
require 'json'
describe Rental do
  let(:book) { Book.new("Title", "Author") }
  let(:person) { Person.new(25, "John Doe") }
  let(:date) { Date.new(2023, 11, 15) }  
  subject(:rental) { described_class.new(date, book, person) }  
  it 'has a date, book, and person' do
    expect(rental.date).to eq(date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end  
  it 'converts to JSON format' do
    json_result = rental.to_json
    expected_json = {
      date: date,
      book: {
        title: book.title,
        author: book.author
      },
      person: {
        id: person.id,
        name: person.name,
        age: person.age,
        class: person.class.to_s
      }
    }.to_json    
    expect(json_result).to eq(expected_json)
  end
end
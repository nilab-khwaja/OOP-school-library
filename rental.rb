class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json
    {'date' => date, 'book' => book.to_json, 'person' => person.to_json}.to_json
  end
end

require_relative '../book'

describe Book do
  publish_date = '2010-01-01'
  publisher = 'Seko'
  cover_state = 'bad'
  before :each do
    @book = Book.new(publisher, publish_date, cover_state)
  end

  it 'Set Publisher and date' do
    expect(@book.publisher).to eq('Seko')
    expect(@book.cover_state).to eq('bad')
  end

  it 'sets the publish_date attribute using the parent constructor' do
    expect(@book.publish_date).to eq('2010-01-01')
  end

  it 'returns true' do
    expect(@book.can_be_archived?).to be true
  end
end

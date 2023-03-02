require_relative '../genre'
require_relative '../item'

describe Genre do
    before :each do
        @genre = Genre.new('Solo')
    end

    it 'Sets name' do
        expect(@genre.name).to eq('Solo')
    end

    it 'Sets id' do
        expect(@genre.id).to be_an(Integer)
    end

    it 'Sets items' do
        expect(@genre.items).to eq([])
    end
end
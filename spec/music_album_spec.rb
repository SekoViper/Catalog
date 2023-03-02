require_relative '../music_album'
require_relative '../item'

describe MusicAlbum do
    before :each do
        @music_album = MusicAlbum.new({})
    end

    it 'Sets Constructor Arguments' do
        expect(@music_album.on_spotify).to be_an(Object)
    end
end
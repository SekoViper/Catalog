require_relative '../label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('New', 'White')
  end

  it 'Sets label title and color' do
    expect(@label.title).to eq('New')
    expect(@label.color).to eq('White')
  end

  it 'sets a random id attribute' do
    expect(@label.id).to be_an(Integer)
  end

  it 'initializes the items array' do
    expect(@label.items).to be_an(Array)
    expect(@label.items).to be_empty
  end
end

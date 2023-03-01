require_relative '../book'
require_relative '../label'
require 'json'

module LabelModule
  def fetch_labels
    labels_json = File.read('./saved/labels.json')
    JSON.parse(labels_json)
  end

  def add_label(item)
    title = ask_question('Label title: ').capitalize
    color = ask_question('Label color: ').capitalize
    label_position = nil

    fetch_labels.each_with_index do |label, index|
      label_position = index if label['title'] == title && label['color'] == color
    end

    label = { 'title' => title, 'color' => color, 'items' => [] }
    label['items'] = fetch_labels[label_position]['items'] if label_position

    item.add_label(Label.new(label['title'], label['color']))
    store_label(label, label_position)
    puts 'label added successfully'
  end

  def store_label(label, label_position)
    labels = fetch_labels
    if label_position
      labels[label_position] = label
    else
      labels << label
    end

    File.write('./saved/labels.json', JSON.generate(labels), mode: 'w')
  end

  def list_all_labels
    labels = fetch_labels
    return puts 'There are no labels stored!' if labels.empty?

    labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
    end
  end
end
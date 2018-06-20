require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meanings, emoticons_array|
    emoticons_hash["get_meaning"][emoticons_array[1]] = meanings
    emoticons_hash["get_emoticon"][emoticons_array[0]] = emoticons_array[1]
  end
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_dictionary = load_library(file_path)
  emoticon_dictionary["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  else "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_dictionary = load_library(file_path)
  emoticon_dictionary["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return meaning
    end
  end
  else "Sorry, that emoticon was not found"
end

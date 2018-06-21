# require modules here
require "yaml"

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_path).each do |translation, emoticons_array|
    english = emoticons_array[0]
    japanese = emoticons_array[-1]
    library["get_meaning"][japanese] = translation
    library["get_emoticon"][english] = japanese
  end  
  library  
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_emoticon"][emoticon]
    return library["get_emoticon"][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_meaning"][emoticon]
    return library["get_meaning"][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end
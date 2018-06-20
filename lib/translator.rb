require "pry"
# require modules here
require "yaml"
def load_library(filepath)
  #binding.pry
  #{get_meaning => {}, get_emoticon => {english_word => japanese_emoticon, english_word => japanese_emoticon}
  main_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(filepath).each do |key, values|
    #binding.pry
    english = values[0]
    japanese = values[1]
    main_hash["get_meaning"][japanese] = key
    main_hash["get_emoticon"][english] = japanese
  end
  main_hash
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  superhash = load_library(filepath)
  superhash["get_emoticon"].each do |eng, jap|
    #binding.pry
    if eng == emoticon
      return jap
    elsif !superhash["get_emoticon"].include?(emoticon)
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(filepath, emoticon)
  megahash = load_library(filepath)
  #binding.pry
  megahash["get_meaning"].each do |jap, meaning|
    if jap == emoticon
      return meaning
    elsif !megahash["get_meaning"].include?(emoticon)
      return "Sorry, that emoticon was not found"
    end 
  end
end

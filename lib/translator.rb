# require modules here

def load_library(filePath)
  # code goes here
  require "yaml"
  emoticons = YAML.load_file("#{filePath}")

  emoticonDictionary = {}

  getMeaningArray = []
  getEmoticonArray = []
  emoticons.each do |meaning, emoticonArray|
    getMeaningArray.push(emoticonArray[1] => meaning)
    getEmoticonArray.push(emoticonArray[0] => emoticonArray[1])
  end

  mergedMeaningHash = {}
  (getMeaningArray.length).times do |counter|
    mergedMeaningHash = mergedMeaningHash.merge(getMeaningArray[counter])
  end

  mergedEmoticonHash = {}
  (getEmoticonArray.length).times do |counter|
    mergedEmoticonHash = mergedEmoticonHash.merge(getEmoticonArray[counter])
  end

  emoticonDictionary["get_meaning"] = mergedMeaningHash
  emoticonDictionary["get_emoticon"] = mergedEmoticonHash

  return emoticonDictionary
end

def get_japanese_emoticon(filePath, englishEmoticon)
  # code goes here
  emoticonDictionary = load_library(filePath)
  if !(((emoticonDictionary["get_emoticon"])[englishEmoticon]).nil?)
    return (emoticonDictionary["get_emoticon"])[englishEmoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filePath, japaneseEmoticon)
  # code goes here
  emoticonDictionary = load_library(filePath)
  if !(((emoticonDictionary["get_meaning"])[japaneseEmoticon]).nil?)
    return (emoticonDictionary["get_meaning"])[japaneseEmoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

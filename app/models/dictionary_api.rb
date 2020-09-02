require 'open-uri'
require 'json'

class DictionaryApi
    
    def self.retrieve_definition(word)
        json_string = open("https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{word}?key=#{ENV['API_KEY']}").read
        JSON.parse(json_string)
    end

    # hash[0]["hwi"]["hw"] -> pronunciation
    # hash[0]["fl"] -> pos
    # hash[0]["def"][0]["sseq"][0][0][1]["dt"][0][1] -> a definition
end
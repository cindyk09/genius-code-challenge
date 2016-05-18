require 'pry'
ARTISTS = ["Rihanna", "The Weekend", "Drake", "The Game", "Lana Del Rey", "Kanye West", "Eminem", "Adele", "Fetty Wap", "Kendrick Lamar"]

#Scenarios
# 1. Should search an artist that is there.
# 2. Edge Case Scenario: should be able to recommend artists if the search entry is mispelled.
#    I want to create a fuzzy search that matches the letters of the mispelled artist name being search
#    by seeing if 50% of it matches the letters of any of the names in the collection
#    Then shove all the simliar artists name that match to that percentage and return it in an search_results of suggestions.
# 3. Should be able to tell you that if the artist does not exist.


def search(query)
  search_results = []
  if ARTISTS.include?(query)
    search_results << query
  elsif !fuzzy_search(query).empty?
    search_results = fuzzy_search(query)
  else
    return ["Artist does not exist in the collection"]
  end
  search_results
end


def fuzzy_search(query)
  suggested_artists = []
  ARTISTS.each do |artist|
    results = artist.split("")
    similar_characters = results & query.split("")
    divided_percentage = similar_characters.length.to_f/artist.length.to_f
      if divided_percentage.to_f > 0.50
        suggested_artists << artist
      end
  end
  suggested_artists.compact
end

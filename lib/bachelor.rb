require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].filter do | person | #person returns the hash of each contestant
    if person["status"] == "Winner"
      return person["name"].split.first #.split.first splits the name string into two separate strings. Then, .first retrieves the first string.
    end
  end
end

#or

  # winner = data[season].find do | contestant |
  #   contestant["status"] == "Winner" # we're assigning this code to a variable called winner, because it will return the winner
  #   person["name"].split[0] #a split method returns an array so you can use [0] to retrieve the first name
  # end 
# end

def get_contestant_name(data, occupation) #use flatten method
  matching_contestant = data.values.flatten.find do |contestant|
    contestant["occupation"] == occupation
  end
  matching_contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  data.values.flatten.reduce(0) do |count, contestant|
    if contestant["hometown"] == hometown 
      count + 1 
    else 
      count 
    end
  end
end

#or

#   data.values.flatten.count do |contestant|
#     contestant["hometown"] == "hometown"
#   end
# end

def get_occupation(data, hometown)
  matching_contestant = data.values.flatten.find do |contestant|
    contestant["hometown"] == hometown
  end
  matching_contestant["occupation"]
end

def get_average_age_for_season(data, season)
  total_ages = data[season].sum do |contestant|
    contestant["age"].to_f
  end
  total_contestants = data[season].length
  (total_ages/total_contestants).round
end
  
#or

#   total_ages = data[season].reduce(0) do |sum, contestant|
#     sum + contestant["age"].to_f
#   end
#   total_contestants = data[season].length
#   (total_ages/total_contestants).round
# end

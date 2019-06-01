require "pry"

def game_hash 
    hashketball = {
        :home => {
          :team_name => "Brooklyn Nets",
          :colors => ["Black", "White"],
          :players => {
                "Alan Anderson" => {
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
                },
                "Reggie Evans" => {
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
                },
                "Brook Lopez" => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
                },
                "Mason Plumlee" => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
                },
                "Jason Terry" => {
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
                }
          }
        },
        :away => {
          :team_name => "Charlotte Hornets" ,
          :colors => ["Turquoise", "Purple"],
          :players => {
                "Jeff Adrien" => {
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
                },
                "Bismack Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 7,
                :blocks => 15,
                :slam_dunks => 10
                },
                "DeSagna Diop" => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
                },
                "Ben Gordon" => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
                },
                "Brendan Haywood" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 22,
                :blocks => 5,
                :slam_dunks => 12
                }
          }
        }
      }
end

def num_points_scored(name)
    complete_hash=game_hash
    complete_hash.each do |location,teams_info_hash|
        teams_info_hash.each do |variables,indi_info|
        
            if indi_info.include?(name)
                return complete_hash[location][variables][name][:points]
            end
            
        end
    end
end


def shoe_size (name)
hash=game_hash
game_hash.each do |location,info|
    info.each do |variables,indi_info|
        if indi_info.include?(name)
            return hash[location][variables][name][:shoe]
        end
    end
end
end


def team_colors(team_name)
    hash=game_hash
    game_hash.each do |location,info|
        info.each do |variables,indi_info|
            if indi_info == team_name
                return hash[location][:colors]
            end
        end
    end
end


def team_names
result=[]
hash=game_hash
    game_hash.each do |location,info|
        result << hash[location][:team_name]
        end
   result
end

def player_numbers(team_name)
    hash = game_hash
    array = []
    hash.each do |location, information|
      if hash[location].values.include?(team_name)
        information.each do |key, info|
          if info.class == Hash
            info.each do |player, stats|
              stats.each do |stat, int|
                if stat == :number
                  array << int.to_i
                end
              end
            end
          end
        end
      end
    end
    return array
end

def player_stats(name)
hash=game_hash
hash.each do |location,information|
  information.each do |key,team_name|
    if team_name.class == Hash
      team_name.each do |player_name,stuffs|
        return stuffs if player_name== name
      end
    end
  end
end
"wrong name"
end

def big_shoe_rebounds
  hash=game_hash
  max=0
  hash.each do |location,information|
    information.each do |key,team_name|
      if team_name.class == Hash
        team_name.each do |player_name,stuffs|
          if stuffs[:shoe]>max
            max =stuffs[:shoe]
          end
        end
      end
    end
  end

  hash.each do |location,information|
    information.each do |key,team_name|
      if team_name.class == Hash
        team_name.each do |player_name,stuffs|
          if stuffs[:shoe]== max
            return stuffs[:rebounds]
          end
        end
      end
    end
  end

end
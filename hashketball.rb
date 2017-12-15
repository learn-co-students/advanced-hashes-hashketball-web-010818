# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players:{
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players:{
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  points = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if player == name
            points << stats.fetch(:points)

          end
        end
      end
    end
  end
  points.flatten.compact.join.to_i
end

def shoe_size(name)
  shoe_size = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if player == name
            shoe_size << stats.fetch(:shoe)

          end
        end
      end
    end
  end
  shoe_size.flatten.compact.join.to_i
end

def team_colors(team_name)
  colors = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
        # binding.pry
      if data == team_name
        colors << team_data[:colors]
        break
      end
    end
  end
  colors.flatten
end

def team_names
  team_names = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      # binding.pry
      if attribute == :team_name
        team_names << data
      end
    end
  end
  team_names
  # binding.pry
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if team_data.key(team_name) == :team_name
            player_numbers << stats.fetch(:number)
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  player_stats = {}
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if player == player_name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  shoe_sizes = []
  rebounds = nil
  #Get largest shoe size
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          stats.collect do |stat, value|
            if stat == :shoe
              shoe_sizes << value
            end
          end
        end
      end
    end
  end

  max_shoe_size = shoe_sizes.max
  location_player = nil
  team_player = nil
  player_max_shoe_size = nil


  #get
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          stats.collect do |stat, value|
            if stat == :shoe
              if value == max_shoe_size
                player_max_shoe_size = player
                location_player = location
                team_player = team_data[:team_name]
                # binding.pry
                break
              end
              # binding.pry
            end
          end
        end
      end
    end
  end
  # binding.pry

  #Get rebounds
  game_hash[location_player][:players][player_max_shoe_size][:rebounds]
  # game_hash[:home][:players]["Mason Plumlee"][:rebounds]

end

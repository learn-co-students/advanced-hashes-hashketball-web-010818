# Write your code here!

require 'pry'

def game_hash
  {
    :home => {
      team_name: "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {number: 0,
                            shoe: 16,
                            points: 22,
                            rebounds: 12,
                            assists: 12,
                            steals:3,
                            blocks: 1,
                            slam_dunks: 1},

         "Reggie Evans" => {number: 30,
                            shoe: 14,
                            points: 12,
                            rebounds: 12,
                            assists: 12,
                            steals:12,
                            blocks: 12,
                            slam_dunks: 7},

          "Brook Lopez" => {number: 11,
                            shoe: 17,
                            points: 17,
                            rebounds: 19,
                            assists: 10,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 15},

        "Mason Plumlee" => {number: 1,
                            shoe: 19,
                            points: 26,
                            rebounds: 12,
                            assists: 6,
                            steals: 3,
                            blocks: 8,
                            slam_dunks: 5},

          "Jason Terry" => {number: 31,
                            shoe: 15,
                            points: 19,
                            rebounds: 2,
                            assists: 2,
                            steals: 4,
                            blocks: 11,
                            slam_dunks: 1}
                          }
                        },
    :away => {
      team_name: "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
          "Jeff Adrien" => {number: 4,
                            shoe: 18,
                            points: 10,
                            rebounds: 1,
                            assists: 1,
                            steals:2,
                            blocks: 7,
                            slam_dunks: 2},

       "Bismak Biyombo" => {number: 0,
                            shoe: 16,
                            points: 12,
                            rebounds: 4,
                            assists: 7,
                            steals: 7,
                            blocks: 15,
                            slam_dunks: 10},

          "DeSagna Diop" => {number: 2,
                            shoe: 14,
                            points: 24,
                            rebounds: 12,
                            assists: 12,
                            steals: 4,
                            blocks: 5,
                            slam_dunks: 5},

           "Ben Gordon" => {number: 8,
                            shoe: 15,
                            points: 33,
                            rebounds: 3,
                            assists: 2,
                            steals: 1,
                            blocks: 1,
                            slam_dunks: 0},

      "Brendan Haywood" => {number: 33,
                            shoe: 15,
                            points: 6,
                            rebounds: 12,
                            assists: 12,
                            steals: 22,
                            blocks: 5,
                            slam_dunks: 12}
                              }
                            }
                          }
end

def num_points_scored(player_name)
  points = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat_hash|
          if player == player_name
            points = stat_hash[:points]
            break
          end
        end
      end
    end
  end
  points
end

=begin
def num_points_scored(name)
  player = find_the_player(name)
  player.fetch(:points)
end


def find_the_team(team_name)
  teams.find {|team| team.fetch(:team_name) == team_name}
end

def find_the_player(name)
  players.find {|player| player.fetch(:player_name) == name}
end
=end

def shoe_size(player_name)
  shoe_size = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat_hash|
          if player == player_name
            shoe_size = stat_hash[:shoe]
            break
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  color = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      color = team_data[:colors]
    end
  end
  color
end

def team_names

  names = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        names << data
      end
    end
  end
  names
end

team_names

def player_numbers(team_name)
  jerseys = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            jerseys << stats[:number]
          end
        end
      end
    end
  end
  jerseys
end

def player_stats(player_name)
  hash = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat_hash|
          if player == player_name
            hash = stat_hash
            break
          end
        end
      end
    end
  end

  #return hash of player stats -- see below
=begin
  player_stats("Alan Anderson")
=> { :number => 0,
     :shoe => 16,
     :points => 22,
     :rebounds => 12,
     :assists => 12,
     :steals => 3,
     :blocks => 1,
     :slam_dunks => 1
   }
=end
  hash
end

def big_shoe_rebounds

  hash = {shoe:0, rebounds:0}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat_hash|
          if stat_hash[:shoe] > hash[:shoe]
            hash[:shoe] = stat_hash[:shoe]
            hash[:rebounds] = stat_hash[:rebounds]
          end
        end
      end
    end
  end
  hash[:rebounds]
end

big_shoe_rebounds



def most_points_scored
  game_hash

  #return player that has most points

end

def winning_team
  game_hash

  #return team that has most points

end

def player_with_longest_name
  game_hash

  #return player with longest name

end

def long_name_steals_a_ton?
  game_hash

  #return true IF player with longest name has the most steals

end

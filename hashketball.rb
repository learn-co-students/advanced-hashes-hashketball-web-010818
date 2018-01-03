# Write your code here!
require "pry"

def game_hash
  game = {

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
      :team_name => "Charlotte Hornets",
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

        "Bismak Biyombo" => {
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

def num_points_scored(player)
  player_points = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      player_points[player] = data[:points]
    end
  end
  player_points[player]
end

def shoe_size(player)
  player_shoe_sizes = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      player_shoe_sizes[player] = data[:shoe]
    end
  end
  player_shoe_sizes[player]
end

def team_colors(team)
  teamcolors = {}
  game_hash.each do |location, team_data|
    teamcolors[team_data[:team_name]] = team_data[:colors]
  end
  teamcolors[team]
end

def team_names
  name_of_teams = []
  game_hash.each do |location, team_data|
    name_of_teams << team_data[:team_name]
  end
  name_of_teams
end

def player_numbers(team)
  team_numbers = {}
  game_hash.each do |location, team_data|
    team_numbers[team_data[:team_name]] = []
    team_data[:players].each do |player, data|
      team_numbers[team_data[:team_name]] << data[:number]
    end
  end
  team_numbers[team]
end

def player_stats(name)
  stats = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      stats[player] = data
    end
  end
  stats[name]
end

def big_shoe_rebounds
  biggest_shoe_size = nil
  rebounds_of_biggest_shoe_size = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
        if biggest_shoe_size == nil || team_data[:players][player][:shoe] > biggest_shoe_size
           biggest_shoe_size = team_data[:players][player][:shoe]
           rebounds_of_biggest_shoe_size = team_data[:players][player][:rebounds]
        end
      end
    end
    rebounds_of_biggest_shoe_size
end

def most_points_scored
  most_points = nil
  highest_scorer = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if most_points == nil || team_data[:players][player][:points] > most_points
        most_points = team_data[:players][player][:points] and highest_scorer = player
      end
    end
  end
  highest_scorer
end

def winning_team
  winning_score = nil
  winner = ''
  game_hash.each do |location, team_data|
    score = 0
    team_data[:players].each do |player, data|
      score += team_data[:players][player][:points]
    end
    if winning_score == nil || score > winning_score
      winning_score = score and winner = team_data[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  longest_name = ''
  game_hash.each do |location, team_data|
    team_data[:players].keys.each{|name| longest_name = name if name.length > longest_name.length}
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = nil
  player_most_steals = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stat|
      if most_steals == nil || team_data[:players][player][:steals] > most_steals
        most_steals = team_data[:players][player][:steals]
        player_most_steals = player
      end
    end
  end
  player_most_steals == player_with_longest_name
end

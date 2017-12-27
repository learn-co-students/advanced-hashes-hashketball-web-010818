# Write your code here!
require "pry"

def game_hash
    {home:{
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
      players: {
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
  points = ""
  game_hash.each do |team, data|
    players = data[:players].keys
    players.each do |player|
      if name == player
        points = data[:players][player][:points]
      end
      points
    end
  end
  points
end

def shoe_size(name)
  size = ""
  game_hash.each do |team, data|
    players = data[:players].keys
    players.each do |player|
      if name == player
        size = data[:players][player][:shoe]
      end
      size
    end
  end
  size
end

def team_colors(name)
  colors = []
  game_hash.each do |team, data|
    if data[:team_name] == name
      colors = data[:colors]
    end
    colors
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, data|
    teams << data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, data|
    if team_name == data[:team_name]
      data[:players].each do |player, data|
        numbers << data[:number]
      end
      numbers
    end
  end
  numbers
end

def player_stats(name)
  stats = {}
  game_hash.each do |team, data|
    players = data[:players].keys
    players.each do |player|
      if name == player
        stats = data[:players][player]
      end
      stats
    end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoes = 0
  rebounds = ""
  players_size_rebound = []
  game_hash.each do |team, data|
    players = data[:players]
    players.each do |player, stats|
      info_array = [player, stats[:shoe], stats[:rebounds]]
      players_size_rebound << info_array
    end
  end
  players_size_rebound.each do |player, size, rebound|
    if size > biggest_shoes
      rebounds = rebound
    end
    rebounds
  end


=begin
  game_hash.each do |team, data|
    players = data[:players]
    players.each do |player, stats|
      shoe = stats[:shoe]
      if biggest_shoes == [] || biggest_shoes[1] < shoe
        biggest_shoes = [player, shoe]
      end
      biggest_shoes
    end
    big_shoe_player = biggest_shoes[0]
    rebounds = players[big_shoe_player][:rebounds]
    rebounds
  end

  rebounds
=end

rebounds

end

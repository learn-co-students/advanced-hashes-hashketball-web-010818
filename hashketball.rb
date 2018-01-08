# Write your code here!
require 'pry'

def game_hash
    {home:{
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
          {
          name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: [
         {
          name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        {
          name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
    ]
  }
}
end

def players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def teams
  team_array = []
  team_array << game_hash[:home]
  team_array << game_hash[:away]
  team_array
end

def find_player(player_name)
  players.find do |player|
    player[:name] == player_name
  end
end

def find_team(name)
  teams.find {|team| team[:team_name] == name }
end

def num_points_scored(name)
  found_player = find_player(name)
  if found_player
    found_player[:points]
  end
end

def shoe_size(name)
  found_player = find_player(name)
  if found_player
    found_player[:shoe]
  end
end

def team_colors(name)
  found_team = find_team(name)
  if found_team
    found_team[:colors]
  end
end

def team_names
  teams = []
  game_hash.each do |team, data|
    teams << data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  team = find_team(team_name)
  if team
    team[:players].map do |player|
      player[:number]
    end
  end
end

def player_stats(name)
  found_player = find_player(name)
  if found_player
    found_player.delete(:name)
    found_player
  end
end

def big_shoe_rebounds
  biggest_shoe_player = nil
  players.each do |player|
    if biggest_shoe_player
      if player[:shoe] > biggest_shoe_player[:shoe]
        biggest_shoe_player = player
      end
    else
      biggest_shoe_player = player
    end
  end
  biggest_shoe_player[:rebounds]
end

def most_points_scored
  most_points = nil
  players.each do |player|
    if !most_points || player[:points] > most_points[:points]
      most_points = player
    end
  end
  most_points[:name]
end

def get_points(team_name)
  team = find_team(team_name)
  points = 0
  team[:players].each do |player|
    points += player[:points]
  end
  points
end

def winning_team
  if get_points("Brooklyn Nets") > get_points("Charlotte Hornets")
    "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

def player_names
  players.map do |player|
    player[:name]
  end
end

def player_with_longest_name
  longest_name = nil
  player_names.each do |player|
    if !longest_name || player.size > longest_name.size
      longest_name = player
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = nil
  players.each do |player|
    if !most_steals || player[:steals] > most_steals[:steals]
      most_steals = player
    end
  end
  most_steals[:name] == player_with_longest_name
end

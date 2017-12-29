require 'pry'


def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" =>{
          :number=>0,
          :shoe=>16,
          :points=>22,
          :rebounds=>12,
          :assists=>12,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>1
        },
        "Reggie Evans" =>{
          :number=>30,
          :shoe=>14,
          :points=>12,
          :rebounds=>12,
          :assists=>12,
          :steals=>12,
          :blocks=>12,
          :slam_dunks=>7
        },
        "Brook Lopez" =>{
          :number=>11,
          :shoe=>17,
          :points=>17,
          :rebounds=>19,
          :assists=>10,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>15
        },
        "Mason Plumlee" =>{
          :number=>1,
          :shoe=>19,
          :points=>26,
          :rebounds=>12,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        "Jason Terry" =>{
          :number=>31,
          :shoe=>15,
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1
          }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" =>{
          :number=>4,
          :shoe=>18,
          :points=>10,
          :rebounds=>1,
          :assists=>1,
          :steals=>2,
          :blocks=>7,
          :slam_dunks=>2
        },
        "Bismak Biyombo" =>{
          :number=>0,
          :shoe=>16,
          :points=>12,
          :rebounds=>4,
          :assists=>7,
          :steals=>7,
          :blocks=>15,
          :slam_dunks=>10
        },
        "DeSagna Diop" =>{
          :number=>2,
          :shoe=>14,
          :points=>24,
          :rebounds=>12,
          :assists=>12,
          :steals=>4,
          :blocks=>5,
          :slam_dunks=>5
        },
        "Ben Gordon" =>{
          :number=>8,
          :shoe=>15,
          :points=>33,
          :rebounds=>3,
          :assists=>2,
          :steals=>1,
          :blocks=>1,
          :slam_dunks=>0
        },
        "Brendan Haywood" => {
          :number=>33,
          :shoe=>15,
          :points=>6,
          :rebounds=>12,
          :assists=>12,
          :steals=>22,
          :blocks=>5,
          :slam_dunks=>12
        }
        }
      }

  }
end

def num_points_scored (player)

  game_hash.collect do |local, data|
    game_hash.dig(local, :players, player, :points)
  end.compact.join().to_i

end

def shoe_size(player)
  game_hash.collect do |local, data|
    game_hash.dig(local, :players, player, :shoe)
  end.compact.join().to_i
end

def team_colors(team)
  game_hash.collect do |local, data|
    if data[:team_name]==team
      data[:colors]
    end
  end.compact.flatten
end


def team_names
  game_hash.collect do |local,data|
    data[:team_name]
  end
end


def player_numbers(team)
  game_hash.collect do |local, data|
    if game_hash[local][:team_name] == team
      game_hash[local][:players].collect do |player, stats|
        game_hash.dig(local,:players,player,:number)
      end.sort
    end
  end.compact.flatten
end

def player_stats(player)

  game_hash.collect do |local, data|
            game_hash.dig(local, :players, player)

  end.compact[0]
    #collect returns an array. first object of array is the value of stats.
end

def big_shoe_rebounds

  largest= 0
  rebounds = 0

  game_hash.each do |local,data|
    data.each do |att, info|
      if att == :players
        info.each do |player, stats|
            stats.each do |traits, number|
              if traits == :shoe && number > largest
                rebounds = game_hash[local][:players][player][:rebounds]
            end
          end
        end
      end
    end
  end
rebounds

end

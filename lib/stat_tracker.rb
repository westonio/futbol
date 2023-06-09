require './lib/game'
require './lib/team'
require './lib/game_team'
require './lib/raw_stats'

class StatTracker
  attr_reader :stats

  def self.from_csv(data)
    StatTracker.new(data)
  end

  def initialize(data)
  # Variable names for methods to be implimented
    @stats = RawStats.new(data)
    @games = stats.games
    @teams = stats.teams
    @game_teams = stats.game_teams
    #require 'pry'; binding.pry
  # How do we want to get these objects to have statistics characteristics (for connecting raw stats)?
  # class GameStats < RawStats
  end

  
  # Game Statistics
  def highest_total_score
    
  end

  def lowest_total_score

  end

  def percentage_home_wins

  end

  def percentage_visitor_wins

  end

  def percentage_ties

  end

  def count_of_games_by_season
    result = {}
    @games.each do |game|
      if result[game.season].nil?
        result[game.season] = 1
      else
        result[game.season] += 1
      end
    end
    result
  end

  def average_goals_per_game
    game_totals = @games.map do |game|
      game.away_goals + game.home_goals
    end
    number_of_games = game_totals.length
    game_totals.sum.fdiv(number_of_games).round(2)
  end

  def average_goals_by_season
    result = {}
    season_groups = @games.group_by { |game| game.season }
    season_groups.each do |season, games|
      season_totals = games.map { |game| game.away_goals + game.home_goals}
      number_of_games = season_totals.length
      season_average = season_totals.sum.fdiv(number_of_games).round(2)
      result[season] = season_average
    end
    result
  end

  # League Statistics

  def count_of_teams

  end

  def best_offense

  end

  def worst_offense

  end

  def highest_scoring_visitor

  end

  def highest_scoring_home_team

  end

  def lowest_scoring_visitor

  end

  def lowest_scoring_home_team

  end

  # Season Statistics

  def winningest_coach

  end

  def worst_coach

  end

  def most_accurate_team

  end

  def least_accurate_team

  end

  def most_tackles

  end

  def fewest_tackles

  end
  
  # Implement the remaining methods for statistics calculations
  # ...
end

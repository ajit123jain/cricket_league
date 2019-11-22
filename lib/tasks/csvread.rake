namespace :csv do
  desc "This will read the data from csv file!"
  task :read do
    require 'csv'
    city_array = []
    team_array = []
    csv = File.read('public/cricket_data.csv')
    CSV.parse(csv, headers: true).each_with_index do |row,i|
      row["city"].present? ? city_array.push(row["city"]) : city_array.push('Unknown') 
      team_array.include?(row["team1"]) ? '' : team_array.push(row["team1"])
      team_array.include?(row["team1"]) ? '' : team_array.push(row["team1"])
    end
    create_city(city_array)
    create_team(team_array)
  end
end

def create_city(city_array)
  puts "City count #{city_array.count}"
  city_array.uniq
  puts "City count #{city_array.uniq.count}"
  # city_array.each do |city|
  #   City.create(name:city)
  # end
end

def create_team(team_array)
  puts "Team count #{team_array.count}"
  team_array.uniq
  puts "Team count #{team_array.uniq.count}"
  # team_array.each do |team|
  #   Team.create(name:team)
  # end
end

def create_match(match_id,year,team1,team2,date)
  team1_id = Team.find_by(name:team1).id
  team2_id = Team.find_by(name:team2).id
  Match.create(match_id:match_id,year:year,team1_id:team1_id,team2_id:team2_id,match_date:date)
end
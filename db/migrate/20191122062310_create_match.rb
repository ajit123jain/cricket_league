class CreateMatch < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :match_id
      t.integer :year 
      t.integer :team1_id
      t.integer :team2_id
      t.date :match_date
      t.integer :winner_team_id
      t.string :toss_decision
      t.string :result
      t.boolean :dl_applied
      t.integer :win_by_run
      t.integer :win_by_wickets
      t.string  :player_of_match
      t.string :umpire1
      t.string :umpire2
      t.string :umpire3
      t.string :venue 
      t.references :city, index: true
      t.timestamps
    end
  end
end

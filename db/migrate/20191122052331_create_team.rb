class CreateTeam < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, index: {unique: true}
      t.string :color
      t.string :logo 
      t.timestamps
    end
  end
end

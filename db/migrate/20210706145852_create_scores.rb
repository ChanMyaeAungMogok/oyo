class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.string :player_name
      t.integer :score
      t.timestamp :score_time
    end
  end
end

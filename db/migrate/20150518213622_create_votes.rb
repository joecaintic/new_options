class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user_id, index: true, foreign_key: true
      t.references :post_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

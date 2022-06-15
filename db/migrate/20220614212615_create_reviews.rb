class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :stars
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

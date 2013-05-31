class CreateTopWords < ActiveRecord::Migration
  def change
    create_table :top_words do |t|
      t.string :word
      t.integer :count

      t.timestamps
    end
  end
end

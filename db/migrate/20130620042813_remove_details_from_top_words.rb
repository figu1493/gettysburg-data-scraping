class RemoveDetailsFromTopWords < ActiveRecord::Migration
  def up
    remove_column :top_words, :tampa_tid
    remove_column :top_words, :tampa_mid
  end

  def down
    add_column :top_words, :tampa_tid, :string
    add_column :top_words, :tampa_mid, :string
  end
end

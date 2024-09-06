class CreateTrends < ActiveRecord::Migration[7.1]
  def change
    create_table :trends do |t|
      t.string :idTag
      t.string :tag
      t.string :idType
      t.string :tagType
      t.string :articles

      t.timestamps
    end
  end
end

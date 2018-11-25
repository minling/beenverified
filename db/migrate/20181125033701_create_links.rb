class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :short_url
      t.string :title
      t.integer :access_count
      t.timestamps
    end
  end
end

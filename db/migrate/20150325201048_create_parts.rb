class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
    	t.string :part_title
    	t.string :part_description
    	t.integer :article_id
      t.timestamps null: false
    end
  end
end

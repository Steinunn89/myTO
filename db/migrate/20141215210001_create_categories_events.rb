class CreateCategoriesEvents < ActiveRecord::Migration
  def self.up
    create_table :categories_events, id: false do |t|
    	t.references :category
    	t.references :event 
    end
    add_index :categories_events, [:category_id, :event_id]
    add_index :categories_events, :event_id
  end

  def self.down
  	drop_table :categories_events
  end
end

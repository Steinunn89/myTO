class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
    	t.date     	"start_date"
    	t.date     	"end_date"
    	t.integer 	"category_id"
      t.timestamps
    end
  end
end

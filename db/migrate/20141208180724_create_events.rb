class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    	t.text :name
    	t.text :description
    	t.text :venue
    	t.text :address
    	t.date :start_date
    	t.date :end_date 
    	t.time :time
    	t.time :start_time
    	t.time :end_time
    	t.time :all_day
    	t.text :website
    	t.text :image
    	
 
    	t.integer :category_id
    	t.integer :user_id



      t.timestamps
    end
  end
end

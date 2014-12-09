class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.text :name, :null => false
    	t.text :description, :null => false
    	t.text :venue, :null => false
    	t.date :start_date, :null => false
    	t.date :end_date, :null => false
    	t.time :start_time, :null => false
    	t.time :end_time, :null => false
    	t.text :address_line1, :null => false
    	t.text :address_line2, :null => false
    	t.text :postal_code, :null => false
    	t.text :city, :null => false, :default => 'Toronto'
    	t.text :category



      t.timestamps
    end
  end
end

class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain, :majestic_topic, :site_topic
      t.integer :links
      
    end
  end
end

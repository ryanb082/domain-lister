class Domain < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Domain.create! row.to_hash
    end
  end
  
end
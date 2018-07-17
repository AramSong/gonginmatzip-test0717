class Restaurant < ApplicationRecord
    mount_uploader :image_path,ImageUploader
    
    validates        :res_name,
                     presence: true
    belongs_to       :state
    belongs_to       :district
    belongs_to       :road
    
    has_many         :menus
    has_many         :visiteds
    has_many         :users, through: :visiteds
    has_many         :reviews
    
    def search_restaurant(condition)
        Restaurant.where("res_name LIKE ?","#{condition}%")
    end
 
end

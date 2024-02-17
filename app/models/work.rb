class Work < ApplicationRecord
    belongs_to :user
    has_many :work_genres
    has_many :genres, through: :work_genres
    
    # accepts_nested_attributes_for :genre_ids, update_only: true

 
  def self.ransackable_attributes(auth_object = nil)
    ["assistant_history", "career",  "drawing_form", "genre", "history", "link_url", "profile", "publishdate", "publisher", "sns_url",  "working_style"]
  end
    
    
  def self.ransackable_associations(auth_object = nil)
    ["genres", "user", "work_genres"]
  end
    

end

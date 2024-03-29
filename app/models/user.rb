class User < ApplicationRecord
  # include ImageUploader::Attachment(:image)
  
    # include ImageUploader[:image]
    include ImageUploader::Attachment(:image)

    before_save { self.email.downcase! }

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_one :work
    
    accepts_nested_attributes_for :work, update_only: true
end


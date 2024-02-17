class Genre < ApplicationRecord
    has_many :work_genres
    has_many :works, through: :work_genres, source: :work
end

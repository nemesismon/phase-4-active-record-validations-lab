class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_filter

    def title_filter
        if title == 'True Facts'
            errors.add(:title, "Title not allowed!")    
        end    
    end
end
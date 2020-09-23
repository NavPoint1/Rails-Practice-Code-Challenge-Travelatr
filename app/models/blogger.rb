class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def total_likes
        # sum = 0
        # self.posts.each { |post|
        #     sum += post.likes
        # }
        # sum

        self.posts.pluck(:likes).sum
        
        #Post.where(blogger: self).pluck(:likes).sum
    end

    def top_post
        # self.posts.max_by { |post|
        #     post.likes
        # }

        self.posts.order('likes DESC').first
    end

    def frequent_destinations
        self.destinations.order('created_at DESC').limit(5)
    end
end

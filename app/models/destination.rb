class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def top_post
        # self.posts.max_by { |post|
        #     post.likes
        # }

        self.posts.order('likes DESC').first
    end

    def avg_age
        self.bloggers.pluck(:age).sum / self.bloggers.size
    end

    def recent_posts
        self.posts.order('created_at DESC').limit(5)
    end
end

class User < ApplicationRecord
    validates :full_name, uniqueness: { case_sensitive: false }, presence: true
    validates :quote, :about_me, presence: true

    belongs_to :user, class_name: "Friendship", optional: true
    def friends
        User.find_by_sql("SELECT users.id, users.full_name FROM users JOIN friendships on users.id = friendships.friend_id
            WHERE friendships.user_id = ?", [self.id])
    end
end

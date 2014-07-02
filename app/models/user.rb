class User < ActiveRecord::Base

# validates_format_of :name, :without => /^\d/

# extend FriendlyId
# friendly_id :name, :use => :slugged

has_many :shouts

has_many :followed_user_relationships,
  class_name: "FollowingRelationship",
  foreign_key: :follower_id

has_many :followed_users, through: :followed_user_relationships

has_many :follower_relationships,
  class_name: "FollowingRelationship",
  foreign_key: :followed_user_id

has_many :followers, through: :follower_relationships
 

def follow(other_user)
  followed_users << other_user
end

def unfollow(other_user)
  followed_users.destroy(other_user)
end

def followed?(other_user)
  followed_users.include?(other_user)
end

def timeline
  Shout.where(user_id: followed_users + [self]).order("created_at DESC")
end

def self.query(search_term)
  where("name like ?", "%#{search_term}%")
end

def to_param
  name
end

end

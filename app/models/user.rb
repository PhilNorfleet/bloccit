class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :favorites

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*') #Select from all columns of the Users table (users)
        .select('COUNT(DISTINCT comments.id) AS comments_count') # Count the comments made by the user
        .select('COUNT(DISTINCT posts.id) AS posts_count') # Count the posts made by the user
        .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # Add the two and label as 'rank'
        .joins(:posts) # join posts table to users with user_id
        .joins(:comments) # similarly for comments
        .group('users.id') # group results so users are returned in distinct rows
        .order('rank DESC') # order results in descending order by rank
  end
end

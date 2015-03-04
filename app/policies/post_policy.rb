class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif current_user
        scope.where( user_id: user.id )
      else
        []
      end
    end
  end
  def index?
    true
  end
end

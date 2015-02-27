class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      end
    end
  end
  def index?
    user.admin? or record.user == user
  end
end

class RestaurantPolicy < ApplicationPolicy

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all # Restaurant.all
      scope.where(user: user) # Restaurant.where(user: current_user)
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # only the owner of the restaurant
    # user -> who is logged in (current_user)
    # record -> instance of restaurant
    # is the owner of the restaurant the same as current_user
    record.user == user
    # return true if you own the restaurant
    # return false if you DON'T own the restaurant
  end

  def destroy?
    record.user == user
  end
end

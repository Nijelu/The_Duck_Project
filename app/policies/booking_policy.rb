class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    user
  end

  def show?
    record.user == user || record.duck.user == user
  end

  def update?
    true
  end

end

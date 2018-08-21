class DuckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    record.user == user
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def detroy?
    record.user == user
  end

end

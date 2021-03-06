class BoardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    true
  end

  def edit?
    user == @record.user
  end

  def delete?
    user == @record.user
  end
end

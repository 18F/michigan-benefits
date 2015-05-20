class AccountPolicy < ApplicationPolicy
  def new?
    true
  end
  alias_method :create?, :new?

  def edit?
    admin? || user == record
  end
  alias_method :update?, :edit?
  alias_method :show?, :edit?

  def destroy?
    admin?
  end
end

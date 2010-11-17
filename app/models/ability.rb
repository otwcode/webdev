class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :manage, :all
    elsif user
      can :read, :all
      can :update, User do |u|
        u && u == user
      end
    else
      can :create, User
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role? :admin  #Rolify
      can :manage, :all # CanCan
      can :access, :rails_admin
      can :dashboard
    end

		#trainer
		can :manage, Pokemon, user_id: user.id if user.has_role? :trainer, Pokemon
    # Pokemon.where(user_id : user.id)

    # gymleader
    can :read, Pokemon if user.has_role? :gymleader, Pokemon
    # :read - Pokemon이라는 리소스에 대해서 :index, :show

		can :manage, Pokemon, user_id: user.id if user.has_role? :gymleader, Pokemon

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

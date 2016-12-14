class UsersController < ApplicationController
  # after_create :add_mailchimp_subscriber

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are on our list, stay tuned!"
    else
      render 'new'
    end
  end

  # def add_mailchimp_subscriber
  #   client = Mailchimp::API.new('<your mailchimp api key>')
  #   client.lists.subscribe('<your mailchimp list id>', {email: email}, {'FNAME' => first_name, 'LNAME' => last_name})
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end

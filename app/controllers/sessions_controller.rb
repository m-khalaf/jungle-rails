class SessionsController < ApplicationController
  def new
  end

  def create
    puts "aaaaaauthincates"
    @user = User.find_by_email(params[:email])
      puts "here is a user: ",@user
      puts params[:password]
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      puts "authincates"
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

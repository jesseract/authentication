class SessionsController < ApplicationController

  def new
  end

  def login
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher
      session[:email] = params[:email]
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

end

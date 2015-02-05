class SessionsController < ApplicationController

  def new
  end

  def login
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher == nil
      redirect_to root_path
      flash.notice = "Incorrect email"
      return
    end

    teacher = teacher.authenticate(params[:password])
    if teacher == false
      redirect_to root_path
      flash.notice = "Incorrect password"
      return
    end

    session[:id] = teacher.id
    redirect_to parents_path




  end

  def destroy
    session[:id] = nil
    redirect_to root_path, notice: "You have logged out."
  end

end

#on controller, get password parameter
#in create method, check against password digest

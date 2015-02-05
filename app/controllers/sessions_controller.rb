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

  def change_password(pswd)
    self.password = pswd
    password_confirmation = pswd
    return changed? && save
  end

  def change_password(old_pswd, pswd, confirm_pswd)
    return false, 'Old password is incorrect' if !valid_password?(old_pswd, true)
    self.password = pswd
    password_confirmation = confirm_pswd
    # update_attributes([user: [password: pswd, password_confirmation: confirm_pswd]])
    print "--------- #{old_pswd} #{pswd} #{confirm_pswd} #{changed?.to_s} ------------"
    return changed? && save, 'New and confirm password are not correct'
  end

  def destroy
    session[:id] = nil
    redirect_to root_path, notice: "You have logged out."
  end

end

#on controller, get password parameter
#in create method, check against password digest

class RegFormsController < ApplicationController
  before_filter :authorize_user!
  
  def new
    @reg_form = RegForm.new
  end

  def show
    @reg_form = RegForm.find(params[:id])
  end

  def create
    @reg_form = RegForm.new(reg_form_params)
    @reg_form.user_id = current_user.id

    if @reg_form.save
      render :new
    else
      render :new
    end
  end

  private
  def reg_form_params
    params.require(:reg_form).permit(:name, :email, :phone, :user_id)
  end
end

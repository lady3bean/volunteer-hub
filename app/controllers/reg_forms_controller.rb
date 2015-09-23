class RegFormsController < ApplicationController
  before_filter :authorize_user!
  
  def new
    @reg_form = RegForm.new
    @reg_form.build_address
  end

  def create
    @reg_form = RegForm.new(reg_form_params)
    @reg_form.user_id = current_user.id

    if @reg_form.save
      redirect_to new_reg_form_path
    else
      redirect_to new_reg_form_path, flash: { notice: 'Invalid data, please try again!' }
    end
  end

  private
  def reg_form_params
    params.require(:reg_form).permit(:firstname, :lastname, :email, :phone, :user_id, address_attributes: [:line1, :line2, :city, :state, :zip])
  end
end

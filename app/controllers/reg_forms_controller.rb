class RegFormsController < ApplicationController
  before_filter :authorize_user!
  
  def new
    @reg_form = RegForm.new
    @reg_form.build_address
  end

  def create
    @reg_form = RegForm.new(reg_form_params)
    @reg_form.user_id = current_user.id
    uri = base_uri + 'validations-test'

    if @reg_form.save
      post_to_bsd(@reg_form, uri)
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

class FollowUpFormsController < ApplicationController
  require "net/http"
  require "uri"

  before_filter :authorize_user!
  
  def new
    @follow_up_form = FollowUpForm.new
    @follow_up_form.build_address
  end

  def create
    @follow_up_form = FollowUpForm.new(follow_up_form_params)
    @follow_up_form.user_id = current_user.id
       
    if @follow_up_form.save
      redirect_to new_follow_up_form_path
    else
      redirect_to new_follow_up_form_path, flash: { notice: 'Invalid data, please try again!' }
    end
  end

  private
  def follow_up_form_params
    params.require(:follow_up_form).permit(:firstname, :lastname, :email, :phone, :user_id, :want_to_volunteer, :subscribe_to_sms, address_attributes: [:zip])
  end
end

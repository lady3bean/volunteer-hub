class FollowUpFormsController < ApplicationController
  require "net/http"

  before_filter :authorize_user!
  
  def new
    @follow_up_form = FollowUpForm.new
    @follow_up_form.build_address
  end

  def create
    @follow_up_form = FollowUpForm.new(follow_up_form_params)
    @follow_up_form.user_id = current_user.id
    bsd_form_data = @follow_up_form.to_json

    if @follow_up_form.save
      uri = URI("https://go.berniesanders.com/page/s/tracing-test")
      request = Net::HTTP.post_form(uri, 'q' => bsd_form_data)
      puts request.body
      byebug
    else
      redirect_to new_follow_up_form_path, flash: { notice: "Invalid data, please try again!" }
    end
  end

  private
  def follow_up_form_params
    params.require(:follow_up_form).permit(:name, :email, :phone, :user_id, :want_to_volunteer, :subscribe_to_sms, address_attributes: [:zip])
  end
end

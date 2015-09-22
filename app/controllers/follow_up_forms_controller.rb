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
    post_to_bsd
    
    if @follow_up_form.save    
      redirect_to controller: 'reg_forms', action: 'new'
    else
      redirect_to controller: 'reg_forms', action: 'new'
    end
  end

  def post_to_bsd
    bsd_form_data = @follow_up_form.to_json

    uri = URI.parse("https://go.berniesanders.com/page/sapi/tracing-test")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({ "query" => bsd_form_data })
    byebug
    response = http.request(request)

    puts response
  end

  private
  def follow_up_form_params
    params.require(:follow_up_form).permit(:name, :email, :phone, :user_id, :want_to_volunteer, :subscribe_to_sms, address_attributes: [:zip])
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session.key?(:user_id)
  end

  def authorize_user!
    redirect_to(login_path) && return unless current_user
  end

  def base_uri
    base_uri = URI.parse('https://go.berniesanders.com/page/sapi/')
  end

  def post_to_bsd(form_data, uri)
    form_data['custom-2392'] = current_user.email
    puts form_data

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data( { "q" => form_data } )
    response = http.request(request)
    puts response
  end
end

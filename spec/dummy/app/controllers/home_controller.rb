class HomeController < ApplicationController
  def index
    render text: "params[:text] = #{params[:text]}"
  end

  def headers
    render text: "session[:accept] = #{accept_header}"
  end

  private

  def accept_header
    request.accept || session['HTTP_ACCEPT']
  end
end

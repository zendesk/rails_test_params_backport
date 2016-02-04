class HomeController < ApplicationController
  def index
    render text: "params[:text] = #{params[:text]}"
  end

  def headers
    render text: "session[:accept] = #{session['HTTP_ACCEPT']}"
  end
end

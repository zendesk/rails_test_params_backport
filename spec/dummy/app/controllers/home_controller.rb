class HomeController < ApplicationController
  def index
    render text: "Text: #{params[:text]} - Accept: #{accept_header}"
  end

  private

  def accept_header
    request.accept || session['HTTP_ACCEPT']
  end
end

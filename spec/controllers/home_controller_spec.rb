require 'spec_helper'

describe HomeController, type: :controller do
  describe 'index' do
    it 'accepts :params' do
      get :index, params: { text: 'Hello World!' }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Text: Hello World!')
    end

  describe 'headers'
    it 'accepts headers' do
      get :index, headers: { 'HTTP_ACCEPT' => 'text/plain' }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Accept: text/plain')
    end
  end

  describe 'raise on offense' do
    it 'raises when an unexpected parameter is passed' do
      expect {
        get :index, wrong: true
      }.to raise_error(RailsTestParamsBackport::ParameterError)
    end

    it 'raises when headers are sent in a separate hash' do
      expect {
        get :index, {}, { 'HTTP_ACCEPT' => 'text/plain' }
      }.to raise_error(RailsTestParamsBackport::ParameterError)
    end
  end
end

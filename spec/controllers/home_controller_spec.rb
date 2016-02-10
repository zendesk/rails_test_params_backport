require 'spec_helper'

describe HomeController, type: :controller do
  it 'accepts the path alone' do
    get :index

    expect(response).to have_http_status(:ok)
  end

  it 'accepts :params' do
    get :index, params: { text: 'Hello World!' }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include('Text: Hello World!')
  end

  it 'accepts headers' do
    get :index, headers: { 'HTTP_ACCEPT' => 'text/plain' }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include('Accept: text/plain')
  end

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

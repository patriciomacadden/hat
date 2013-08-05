require 'minitest_helper'

describe HAT::RootController do
  include Rack::Test::Methods

  def app
    HAT::Application.new
  end

  describe 'GET /' do
    it 'must be ok' do
      get '/'
      last_response.must_be :ok?
      last_response.body.must_match /Hello HAT!/
    end
  end
end

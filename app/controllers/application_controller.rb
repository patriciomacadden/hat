class HAT::ApplicationController < HAT::Application
  include Hobbit::Render
  include Hobbit::Session

  def layouts_path
    'app/views/layouts/'
  end
end

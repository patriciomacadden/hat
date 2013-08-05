class HAT::ApplicationController < HAT::Application
  include Hobbit::AssetTag
  include Hobbit::Render
  include Hobbit::Session

  def layouts_path
    'app/views/layouts/'
  end

  def template_engine
    'slim'
  end
end

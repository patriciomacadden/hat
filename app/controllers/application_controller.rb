class HAT::ApplicationController < HAT::Application
  include Hobbit::AssetTag
  include Hobbit::EnhancedRender
  include Hobbit::Session

  def template_engine
    'slim'
  end

  def layout_path(template)
    "app/views/layouts/#{template}.#{template_engine}"
  end
end
class HAT::RootController < HAT::ApplicationController
  def view_path(template)
    "app/views/root/#{template}.#{template_engine}"
  end

  get '/' do
    render 'index', {}, layout: 'application'
  end
end


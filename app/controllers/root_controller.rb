class HAT::RootController < HAT::ApplicationController
  def views_path
    'app/views/root'
  end

  get '/' do
    render 'index'
  end
end

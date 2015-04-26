# see: http://dev.classmethod.jp/server-side/language/modern-web-creating-environment/

class App < Sinatra::Base
  register Sinatra::Reloader

  # **.haml to **.html
  get %r{^/(.*)\.html$} do
    haml params[:captures].first.to_sym
  end

  # **.scss to **.css
  get '/stylesheets/main.css' do
    scss :'scss/main'
  end

  # **.coffee to **.js
  get '/javascripts/main.js' do
    coffee :'coffee/main'
  end

end

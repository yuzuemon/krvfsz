# see: http://dev.classmethod.jp/server-side/language/modern-web-creating-environment/

class App < Sinatra::Base
  register Sinatra::Reloader

  # **.haml to **.html
  get %r{^/(.*)\.html$} do
    haml params[:captures].first.to_sym
  end

  # **.scss|coffee to **.css|js
  get %r{^/(stylesheets|javascripts)/(.*)\.(css|js)$} do
    dir = params[:captures][0] == 'stylesheets' ? 'scss' : 'coffee'
    file = params[:captures][1]
    method = params[:captures][2] == 'css' ? :scss : :coffee
    send(method, :"#{ dir }/#{ file }")
  end

end

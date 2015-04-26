# gemをすべて読み込み
require 'bundler'
Bundler.require

# Appクラスを読み込み
require './app'

task :test do
  # モックのセッションオブジェクトを作成
  mock_sesion = Rack::MockSession.new(App)

  # rack-testのセッションでラップ
  app = Rack::Test::Session.new(mock_sesion)

  # トップページを取得してhtmlを出力してみる
  p app.get('/index.html').body
end


class ApplicationController < ActionController::Base
  #CSRF対応コードを生成
  protect_from_forgery
end

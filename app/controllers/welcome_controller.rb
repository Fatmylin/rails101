class WelcomeController < ApplicationController
  def index
    flash[:notice] = '安安我是菜鳥工程師Jimmy'
    flash[:alert] = '有雷勿近'
    flash[:warning] = '請大家多多指教'
  end
end

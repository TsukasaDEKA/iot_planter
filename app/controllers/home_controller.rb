class HomeController < ApplicationController
  def top
    gon.data = []
    gon.data_num = 30
    gon.data_num.times do
      gon.data << rand(100.0)
    end
  end
end

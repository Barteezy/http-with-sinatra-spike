require "sinatra/base"


class LukesApp < Sinatra::Application

  def initialize
    super
    @moves = ["Head Spin", "Top Rock", "Nip Tuck"]
  end

  get "/" do
    erb :index, :locals => {:moves => @moves}
  end

  post "/" do
    @moves << params[:new_move]
    redirect "/"
  end

  delete "/:move" do
    @moves.delete(params[:move])
    redirect "/"
  end


  get "/moves" do
    "You are rockin' #{@moves.length.to_s} moves"
  end

  get "/moves/:move" do
    @move = params[:move]
    erb :moves, :locals => {:move => @move}
  end
end

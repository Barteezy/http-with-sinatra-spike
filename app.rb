require "sinatra/base"


class MyApp < Sinatra::Application
#set :views, Proc.new {File.join(root, "views")}

  def initialize
    super
    @moves = ["Head Spin", "Top Rock", "Nip Tuck"]
  end

  get "/" do
    erb :index, :locals => {:moves => @moves}
  end


  get "/moves" do
    "You are rockin' #{@moves.length.to_s} moves"
  end

  get "/moves/:move" do
    @move = params[:move]
    @new_move = params[:input]
    if params
      @move << @new_move
      erb :moves, :locals => {:moves => @moves}
    end
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  # @message = Message.where( id: params[:id] ).limit(5)
  # @message = Message.where( id: params[:id] )
  erb :'messages/show'
end

get '/all/:author' do
  @message = Message.where( author: params[:author])
  erb :'messages/all'
end

post '/messages' do
  @message = Message.new(
    url:   params[:url],
    content: params[:content],
    author:  params[:author]
  )

  puts @message.url

  if @message.url =~ /^#{URI::regexp}$/
    puts "Fuck me, this is all sorts of awesome!"
    # redirect '/messages'
  end

  if @message.url =~ URI::regexp
    puts "Fuck me, MUCH LESS COMPLICATED!!!!"
    # redirect '/messages'
  end

  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end






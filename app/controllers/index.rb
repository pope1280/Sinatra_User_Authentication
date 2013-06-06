get '/' do
  @user = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do   # sign-out -- invoked via AJAX
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.find_or_create_by_email(params[:user])
  
  if user.valid?
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/users/new'
  end

end

class UsersController < ApplicationController


    get "/signup" do
    if logged_in?
      redirect "users/#{current_user.id}"
    else 
      erb :'users/signup'
      
      
    end 
  end
      post'/signup' do
        @user = User.new(:username => params[:username], :email => params[:email],:password => params[:password])
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
          redirect '/signup'
        end
        if @user.save
          session[:id] = @user.id
          redirect "/users/#{@user.id}"
        end 
      end
    
      get '/login' do 
        if logged_in?
          redirect "/users/#{current_user.id}"
        else 
        erb :'login'
        end 
      end
    
      post '/login' do 
      @user = User.find_by(email: params[:email])
      if params[:username].empty? || params[:email].empty? || params[:password].empty?
        redirect '/login'
      end 
      
      if !@user.authenticate(params[:password])
       
       redirect "users/signup"
       
      elsif @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
       
      end 
    
    end
    
    get '/logout' do 
      session.clear
      redirect '/login'
    end 
  

    get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
    end
    # get '/users/:id' do 

    #     @user = User.find_by(id: params[:id])
    #     erb :'users/show'
    # end
    

    


end

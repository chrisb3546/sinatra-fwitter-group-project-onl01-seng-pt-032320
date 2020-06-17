class TweetsController < ApplicationController

    get '/tweets' do 
        if !logged_in?
            redirect '/login'
        else
            redirect "tweets"
        end 
        erb :'tweets/index'
        
    end 


    get '/tweets/new' do 
       if logged_in?
        erb :'tweets/new'
    else 
        redirect '/login'
    end
    end 

    post '/tweets' do 
        if params[:content].empty?
            redirect 'tweets/new'
        else
       @tweet = Tweet.create(username: current_user.username, user_id: current_user.id, content: params[:content])
       redirect "/tweets/#{@tweet.id}"
        end 
      
    end

    get '/tweets/:id' do 
        @tweet = Tweet.find_by(id: params[:id])
        erb :'tweets/show'
    end

    post '/tweets/:id/delete' do 

    end



end

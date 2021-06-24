class UsersController < ApplicationController
    #signup
    get '/signup' do 
        erb :"users/signup"
    end

    post '/signup' do
       
        user = User.new(params)
        if user.name.blank? || user.email.blank? || user.password.blank? 
            flash[:error] = "Missing Information on Sign Up"
            redirect '/signup'
        elsif
            User.find_by_email(params[:email])
            flash[:error] = "Email Already Registered"
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id #logging user in 
            redirect '/posts'
        end
    end

    get '/login' do 
        erb :"users/login"
    end

    post '/login' do 
        user = User.find_by_email(params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end
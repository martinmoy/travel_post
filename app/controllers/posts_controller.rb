class PostsController < ApplicationController
    # show all the post by the users
    get '/posts' do
        redirect_if_not_logged
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do 
        erb :'posts/new'
    end

    post '/posts' do 
        @post = Post.new(params)
        @post.user_id = session[:user_id]
        @post.save
        #user.posts.build(params) 
        redirect "posts/#{@post.id}"
    end

    get '/posts/:id' do
        get_post
        redirect_if_not_logged
        redirect_if_not_authorized
        erb :'posts/show'
    end

    get '/posts/:id/edit' do 
        get_post
        redirect_if_not_logged
        redirect_if_not_authorized
        erb :'posts/edit'
    end

    patch '/posts/:id' do
        get_post
        redirect_if_not_logged
        redirect_if_not_authorized
        @post.update(title: params[:title], content: params[:content], country: params[:country])
        redirect to "/posts/#{@post.id}"
    end

    delete '/posts/:id' do
        get_post
        redirect_if_not_authorized
        @post.destroy
        redirect '/posts'
    end

private

    def get_post 
        @post =Post.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @post.user != current_user
            flash[:error] = "You are not the owner of this post"
            redirect '/posts'
        end
    end

    def redirect_if_not_logged
        if !logged_in?
            flash[:error] = "You are not logged in!!!"
            redirect '/login'
        end
    end

end
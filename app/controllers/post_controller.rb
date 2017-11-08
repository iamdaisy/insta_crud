class PostController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def create  # erb :create 생략되어있음(포함)
        @title = params[:title]
        @content = params[:content]
        
        Post.create(
            title: @title,
            content: @content
        )
        
        Post.all
        redirect_to '/'
    end
    
    def destroy
        # 지울 글을 찾는다
        # 해당 글을 지운다
        @id = params[:id]
        post = Post.find(params[:id])
        post.destroy

        redirect_to '/'
    end
    
    def show
        @id = params[:id]
        @post = Post.find(@id)
    end
    
    def modify
        @id = params[:id]
        @post = Post.find(@id)
    
    end

    def update
        @id = params[:id]
        @post = Post.find(@id)
        
        @post.update(
            title: params[:title],
            content: params[:content]
        )
        
        redirect_to '/'

    end
end

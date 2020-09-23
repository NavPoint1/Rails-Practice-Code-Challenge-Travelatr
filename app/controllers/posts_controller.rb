class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        # byebug
        @post = Post.create(post_params(:title, :content, :blogger_id, :destination_id))
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params(:title, :content))
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def like
        @post = Post.find(params[:id])
        likes = @post.likes + 1
        @post.update(likes: likes)
        redirect_to post_path(@post)
    end

    private

    def post_params(*args)
        params.require(:post).permit(*args)
    end
end

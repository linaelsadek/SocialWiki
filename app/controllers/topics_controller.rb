class TopicsController < ApplicationController
  #has_many :comments
  
  def new
    @topic = Topic.new
  end

  def create
    #render plain: params[:topic].inspect
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def index
    @topics = Topic.all
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :author, :content)
  end

  #def create_comment
  #end
end

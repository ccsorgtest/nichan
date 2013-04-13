# coding: utf-8

class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @new_topic = Topic.new
    @new_comment = Comment.new
  end

  def create
    @topic = Topic.new(params[:topic])
    p @topic
    @topic.save
    @comment = Comment.new(params[:comment])
    @comment.topic_id = @topic.id
    @comment.save
    @comments = [@comment]
    redirect_to :controller => 'comment', :action => 'index', :topic_id => @topic.id
  end
end


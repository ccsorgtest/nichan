# coding: utf-8

class CommentController < ApplicationController
  def index
    @topic = Topic.find_by_id(params[:topic_id])
    @comments = Comment.find_all_by_topic_id(params[:topic_id])
    @new_comment = Comment.new
    @new_comment.topic_id = params[:topic_id]
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.name = '名無しさん' if @comment.name.empty?
    @comment.topic_id = params[:topic_id]
    @comment.save
    index
    render 'comment/index'
  end
end

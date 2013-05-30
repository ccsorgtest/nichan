# coding: utf-8

#投稿画面に関するコントローラ
class CommentController < ApplicationController
  #一覧表示
  def index
    #スレッド一覧画面で選択したスレッドのIDから、
    #スレッドのオブジェクトを取得（ビューで、タイトルを表示するのに参照する）
    @topic = Topic.find_by_id(params[:topic_id])
    #スレッド一覧画面で選択したスレッドの投稿を全て取得
    @comments = Comment.find_all_by_topic_id(params[:topic_id])
    #新規投稿のための受け皿用commentオブジェクトを作っておく
    @new_comment = Comment.new
  end

  #新規投稿
  def create
    #ビューのform_forヘルパーにより、":comment"というシンボルで
    #モデルに対応した入力値のオブジェクトが参照できる。
    #実際には、下記のハッシュ形式でデータが入ってくる
    #  :comment => {
    #    :name => "ビューで入力した名前", 
    #    :text => "ビューで入力した投稿内容",
    #    :topic_id => 空
    #  }
    #この:commentを、Commnet.newに渡すことで、入力値を反映した
    #Commentオブジェクトを作成する（下記）
    @comment = Comment.new(params[:comment])
    #名前が見入力の場合、'名無しさん'にする
    @comment.name = '名無しさん' if @comment.name.empty?
    #スレッドIDを設定する
    @comment.topic_id = params[:topic_id]
    #saveメソッドでDBに書き込む
    @comment.save
    #indexメソッドで、一覧表示データを取得する
    index
    #indexビューを表示する
    render 'comment/index'
  end
end

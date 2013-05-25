# coding: utf-8

#スレッド一覧画面に関するコントローラ
class TopicsController < ApplicationController
  #一覧表示
  def index
    #スレッド一覧をDBから取得
    @topics = Topic.all
    #新規スレッド用受け皿用Topicオブジェクトを作っておく
    @new_topic = Topic.new
    #新規スレッド作成時の1件目の投稿の受け皿用Commentオブジェクトを作っておく
    @new_comment = Comment.new
  end

  #新規スレッド作成
  def create
    #ビューのform_forヘルパーにより、":topic"、":comment"というシンボルで
    #モデルに対応した入力値のオブジェクトが参照できる。
    #実際には、下記のハッシュ形式でデータが入ってくる
    #  :topic => {
    #    :title => "ビューで入力したタイトル"
    #  }
    #  :comment => {
    #    :name => "ビューで入力した名前", 
    #    :text => "ビューで入力した投稿内容",
    #    :topic_id => 空
    #  }
    #:topicを、Topic.newに渡すことで、入力値を反映した
    #Topicオブジェクトを作成する（下記）
    @topic = Topic.new(params[:topic])
    #saveメソッドでDBに書き込む
    @topic.save
    #:commentを、Commnet.newに渡すことで、入力値を反映した
    #Commentオブジェクトを作成する（下記）
    @comment = Comment.new(params[:comment])
    #投稿のtopic_idをスレッドのid(@topic.id)で設定する
    #@topic.idは、Topic.new時には空(nil?)だが、.save時に決定している（と思う）
    @comment.topic_id = @topic.id
    #saveメソッドでDBに書き込む
    @comment.save
    #一覧表示用の配列(@comments)に、今saveした@commentだけを入れる
    @comments = [@comment]
    #投稿一覧表示用ビューにリダイレクトする
    redirect_to :controller => 'comment', :action => 'index', :topic_id => @topic.id
  end
end


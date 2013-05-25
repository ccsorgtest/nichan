# coding: utf-8

#�X���b�h�ꗗ��ʂɊւ���R���g���[��
class TopicsController < ApplicationController
  #�ꗗ�\��
  def index
    #�X���b�h�ꗗ��DB����擾
    @topics = Topic.all
    #�V�K�X���b�h�p�󂯎M�pTopic�I�u�W�F�N�g������Ă���
    @new_topic = Topic.new
    #�V�K�X���b�h�쐬����1���ڂ̓��e�̎󂯎M�pComment�I�u�W�F�N�g������Ă���
    @new_comment = Comment.new
  end

  #�V�K�X���b�h�쐬
  def create
    #�r���[��form_for�w���p�[�ɂ��A":topic"�A":comment"�Ƃ����V���{����
    #���f���ɑΉ��������͒l�̃I�u�W�F�N�g���Q�Ƃł���B
    #���ۂɂ́A���L�̃n�b�V���`���Ńf�[�^�������Ă���
    #  :topic => {
    #    :title => "�r���[�œ��͂����^�C�g��"
    #  }
    #  :comment => {
    #    :name => "�r���[�œ��͂������O", 
    #    :text => "�r���[�œ��͂������e���e",
    #    :topic_id => ��
    #  }
    #:topic���ATopic.new�ɓn�����ƂŁA���͒l�𔽉f����
    #Topic�I�u�W�F�N�g���쐬����i���L�j
    @topic = Topic.new(params[:topic])
    #save���\�b�h��DB�ɏ�������
    @topic.save
    #:comment���ACommnet.new�ɓn�����ƂŁA���͒l�𔽉f����
    #Comment�I�u�W�F�N�g���쐬����i���L�j
    @comment = Comment.new(params[:comment])
    #���e��topic_id���X���b�h��id(@topic.id)�Őݒ肷��
    #@topic.id�́ATopic.new���ɂ͋�(nil?)�����A.save���Ɍ��肵�Ă���i�Ǝv���j
    @comment.topic_id = @topic.id
    #save���\�b�h��DB�ɏ�������
    @comment.save
    #�ꗗ�\���p�̔z��(@comments)�ɁA��save����@comment����������
    @comments = [@comment]
    #���e�ꗗ�\���p�r���[�Ƀ��_�C���N�g����
    redirect_to :controller => 'comment', :action => 'index', :topic_id => @topic.id
  end
end


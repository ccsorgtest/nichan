class Comment < ActiveRecord::Base
  attr_accessible :name, :num, :text, :topic_id
end

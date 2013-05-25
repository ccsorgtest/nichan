class Comment < ActiveRecord::Base
  attr_accessible :name, :text, :topic_id
end

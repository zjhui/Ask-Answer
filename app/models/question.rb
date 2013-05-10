class Question < ActiveRecord::Base
   attr_accessible :title, :content, :tag_list
   validates_presence_of :title, :content

   acts_as_taggable
end

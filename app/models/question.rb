class Question < ActiveRecord::Base
#   before_save  :render_content
   attr_accessible :title, :content
   validates_presence_of :title, :content

#   protected
#   def render_content
#     require 'redcarpet'
#     renderer = Redcarpet::Render::HTML.new( :hard_wrap => true )
#     extensions = {fenced_code_blocks: true}
#     redcarpet = Redcarpet::Markdown.new(renderer, extensions)
#     self.render_content = redcarpet.render(self.content.to_s)
#   end
end

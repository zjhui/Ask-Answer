class AddContentToQuestions < ActiveRecord::Migration
  def change
    add_column  :questions, :content, :text
  end
end

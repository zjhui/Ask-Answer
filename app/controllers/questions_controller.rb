class QuestionsController < ApplicationController 
  
  def index
    @questions = Question.order(:created_at)
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new  
  end

  def create
    @question = Question.new(params[:question])
    @question.save!
    flash[:notic] = 'Page saved'
    redirect_to :action => 'index'
    rescue ActiveRecord::RecordInvalid
      render  :action => 'new'
  end
end

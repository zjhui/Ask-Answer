class QuestionsController < ApplicationController 
  before_filter :authenticate_user!, :except => [:index,:show]
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    else
      @questions = Question.all
    end
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new  
  end

  def create
    @question = Question.new(params[:question])
  #  @question.save!
  #  flash[:notic] = 'Page saved'
  #  redirect_to :action => 'index'
  #  rescue ActiveRecord::RecordInvalid
    #    render  :action => 'new'
    respond_to do |format|
      if @question.save
        format.html  { redirect_to(@question,
                                   :notice => 'question was successfully created.') }
        format.json  { render :json => @question,
                       :status => :created, :location => @question }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @question.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
#    if @question.save
#      redirect_to(question_path(@question.id), :notice => t("success update"))
#    else
#      render :action => "new"
#    end
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question,
                      notic: "Question #{@question.title} was successfully updated") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_path }
      format.json { head :no_content}
    end
  end
end

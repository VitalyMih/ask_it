class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    question_by_id
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      redirect_to new_question_path
    end
  end

  def edit
    question_by_id
  end

  def update
    if question_by_id.update(question_params)
      redirect_to questions_path
    else
      redirect_to edit_question_path(question_by_id)
    end
  end

  def destroy
    question_by_id.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def question_by_id
    @question = Question.find_by(id: params[:id])
  end
end

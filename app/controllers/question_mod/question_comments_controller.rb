module QuestionMod
  class QuestionCommentsController < QuestionMod::ApplicationController
    before_action :find_question
    def index
      
    end
    
    def new
      @question_comment = @question.question_comments.new
    end

    def create
      @question_comment = @question.question_comments.create(question_comment_params)
      @question_comment.creator = current_user
      if @question_comment.save
        redirect_to "/questions"
      end
    end

    def destroy
      @question_comment = QuestionMod::QuestionComment.find(params[:id])
      @question_comment.destroy
      redirect_to "/questions/#{@question_id}/answers"
    end

    private

      def question_comment_params  
        params.require(:question_comment).permit(:content, :question_comment_id)
      end

      def find_question
        @question = QuestionMod::Question.find(params[:question_id])
        @question_id = params[:question_id]
      end
  end
end
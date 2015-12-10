module QuestionMod
  module Api
    class AnswersController < QuestionMod::ApplicationController
      def vote
        answer = QuestionMod::Answer.find(params[:id])
        render :json =>{
          :id => answer.id,
          :vote_sum => answer.votes.where(:kind => "up").count
        }
      end
    end
  end
end
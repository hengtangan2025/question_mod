module QuestionMod
  class Engine < ::Rails::Engine
    isolate_namespace QuestionMod
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/question_mod/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end

      User.class_eval do
        has_many :questions, class_name: 'QuestionMod::Question'
        has_many :answers, class_name: 'QuestionMod::Answer'
        has_many :comments, class_name: 'QuestionMod::Comment'
        has_many :votes, class_name: 'QuestionMod::Vote'

        def created_questions 
          QuestionMod::Question.where(:creator_id => self.id.to_s)
        end

        def answered_questions
          arr = []

          self.answers.map do |answer| 
            arr << answer.question
          end.compact.uniq

          return arr
        end

      end      
    end
  end
end

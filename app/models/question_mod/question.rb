module QuestionMod
  class Question
    include Mongoid::Document
    include Mongoid::Timestamps
    include QuestionMod::QuestionVoteableMethod

    # title content 不能为空
    field :title,   :type => String
    field :content, :type => String
    # 统计 所有 QuestionVote 的值总和
    # up +1
    # down -1
    field :vote_sum, :type => Integer, :default => 0

    validates :title, :presence => true, :uniqueness => true
    validates :content, :presence => true
    validates :creator, :presence => true
    # creator 不能为空
    belongs_to :creator,        :class_name => 'User'
    has_many   :answers,        :class_name => 'QuestionMod::Answer'
    has_many   :question_votes, :class_name => 'QuestionMod::QuestionVote'
  end
end

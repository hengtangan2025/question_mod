# 引用 rails engine
require 'question_mod/engine'
require 'question_mod/rails_routes'

module QuestionMod
  class << self
    mattr_accessor :user_class
    def question_mod_config
      self.instance_variable_get(:@question_mod_config) || {}
    end

    def set_mount_prefix(mount_prefix)
      config = QuestionMod.question_mod_config
      config[:mount_prefix] = mount_prefix
      QuestionMod.instance_variable_set(:@question_mod_config, config)
    end

    def get_mount_prefix
      question_mod_config[:mount_prefix]
    end
  end
end
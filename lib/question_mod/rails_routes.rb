module QuestionMod
  class Routing
    def self.mount(prefix, options)
      QuestionMod.set_mount_prefix prefix

      Rails.application.routes.draw do
        mount QuestionMod::Engine => prefix, :as => options[:as]
      end
    end
  end
end
module QuestionMod
  class Routing
    # QuestionMod::Routing.mount "/file_part_upload", :as => 'file_part_upload'
    def self.mount(prefix, options)
      QuestionMod.set_mount_prefix prefix
      
      Rails.application.routes.draw do
        mount QuestionMod::Engine => prefix, :as => options[:as]
      end
    end
  end
end
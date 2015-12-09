Rails.application.routes.draw do
  QuestionMod::Routing.mount '/', as: 'question_mod'
  mount PlayAuth::Engine => '/auth', :as => :auth
  mount KcNotifications::Engine => '/notifications', :as => 'kc-train/kc_notifications'
end

SinglyRailsSkeleton::Application.routes.draw do
  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  match "facebook/:api_method" => "default#facebook"
  match "twitter/:api_method" => "default#twitter"
  root :to                       => "default#home"
end

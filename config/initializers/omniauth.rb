Rails.application.config.middleware.use OmniAuth::Builder do
  provider :singly, "ae589cd8c2a589b0381715eb73c25b2a", "91a16fba55639bc91b1d6233e83bca35" if Rails::env.production?
  provider :singly, "586950e9f24e52ff669f14dc4eca9f6c", "bd894ad8fdbb76ea2344f02e7817d89a" if Rails::env.development?
#  provider :singly, ENV['SINGLY_ID'], ENV['SINGLY_SECRET']
end

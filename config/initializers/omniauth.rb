Rails.application.config.middleware.use OmniAuth::Builder do
  provider :singly, "ae589cd8c2a589b0381715eb73c25b2a", "91a16fba55639bc91b1d6233e83bca35"
#  provider :singly, ENV['SINGLY_ID'], ENV['SINGLY_SECRET']
end

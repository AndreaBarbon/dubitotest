Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'TksoILVrizqOIImebdQJxA', 'S65jr1AhrsqL7ErtY00qLccAmF9NTwhbhJQ3KPF0N8'
  provider :facebook, '255543811212070', '98ce6f73850af2bbd5d1b343e8de9b2c'     
  provider :google_oauth2, '872706108016.apps.googleusercontent.com', '_wVHa4uKiV91x6B48LLHGxh1'
end
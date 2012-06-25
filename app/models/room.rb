class Room < ActiveRecord::Base
  attr_accessible :name, :players
  
  has_many :messages, :dependent => :destroy
end

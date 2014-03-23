class Message < ActiveRecord::Base

validates :url, presence: true
validates :content, presence: true
validates :author, presence: true

end
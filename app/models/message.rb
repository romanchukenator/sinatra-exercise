class Message < ActiveRecord::Base
  validates :content, presence: true
  validates :author, presence: true

  # validates_format_of :url, with: URI.regexp
end
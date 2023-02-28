class ModeratedModel < ApplicationRecord
  validates :title, :content, presence: true
  include Moderable
end

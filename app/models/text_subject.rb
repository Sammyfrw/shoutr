class TextSubject < ActiveRecord::Base
  has_many :shouts, as: :shoutable
end
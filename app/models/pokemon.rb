class Pokemon < ApplicationRecord
  resourcify
  belongs_to :user
end

class ItemFile < ActiveRecord::Base
  belongs_to :item
  belongs_to :storage
end

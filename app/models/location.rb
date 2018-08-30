class Location < ApplicationRecord
	geocoded_by :address
	belongs_to :user

    after_validation :geocode, :if => :address_changed?
end
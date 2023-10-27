class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User", foreign_key: "user_id"
  belongs_to :listing
  belongs_to :admin, class_name: "User", foreign_key: "user_id"



end

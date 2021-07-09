class Score < ApplicationRecord
    scope :filter_by_dateFrom, -> (dateFrom) { where("score_time >= ?", dateFrom)}
    scope :filter_by_dateTo, -> (dateTo) { where("score_time <= ?", dateTo)}
    scope :filter_by_player_name, -> (player_list) { where("lower(player_name) IN(?)", player_list)}
    scope :filter_by_offset, -> (offset) { offset(offset)}
    scope :filter_by_limit, -> (limit) { limit(limit)}

    validates :player_name, presence: true
    validates :score, presence: true, numericality: { only_integer: true }
    validates :score_time, presence: true, format: { with: /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/, message: "must be a valid datetime" }

end

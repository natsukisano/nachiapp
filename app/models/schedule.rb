class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  # validate :start_end_check

  def start_end_check
    errors.add(:end_date, "終了日は開始日より前の日時は登録できません。") unless
    :start < :end
  end
end

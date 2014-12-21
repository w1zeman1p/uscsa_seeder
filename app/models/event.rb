# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  meet_id    :integer
#  start_at   :datetime
#  sex        :integer          default(0)
#  discipline :integer          default(0)
#  race_type  :integer          default(0)
#

class Event < ActiveRecord::Base
  belongs_to :meet, counter_cache: true
  has_many :seeds, dependent: :destroy

  validates :meet, :start_at, :sex, :discipline, presence: true

  enum sex: [:male, :female]
  enum discipline: [:free_style_ski, :alpine_ski, :snowboard]
  enum race_type: [:gs, :s, :bx, :sx, :ss, :rj]

  FULL_RACE_TYPES = {
    gs: 'Giant Slalom',
    s: 'Slalom',
    bx: 'Boarder Cross',
    sx: 'Skier Cross',
    ss: 'Slopestyle',
    rj: 'Rail Jam'
  }

  def plural_gender
    { 'male' => "Men's", 'female' => "Women's" }[sex]
  end

  def name
    "#{ plural_gender } #{ full_race_type }"
  end

  def athlete_ids_and_seeded
    seeds.pluck(:athlete_id, :seeded)
  end

  def seeded_positions(school_id)
    self.seeds.select{ |s| s.athlete.school.id == school_id }.map { |s| s.seeded }
  end

  def self.full_race_types
    race_types.keys.map { |t| FULL_RACE_TYPES[t.to_sym] }
  end

  def full_race_type
    FULL_RACE_TYPES[race_type.to_sym]
  end

  def seeding_closes_at
    (start_at - 1.day).to_date.to_time + 17.hours
  end
end

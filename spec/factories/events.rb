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

FactoryGirl.define do
  factory :event do
    meet
    start_at Date.new(2000, 01, 01).to_time
  end
end

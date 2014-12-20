# == Schema Information
#
# Table name: schools
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  abbreviation :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  teams_count  :integer          default(0)
#

require 'rails_helper'

RSpec.describe School, :type => :model do
end

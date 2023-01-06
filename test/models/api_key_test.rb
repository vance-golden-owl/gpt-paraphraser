# == Schema Information
#
# Table name: api_keys
#
#  id           :bigint           not null, primary key
#  bearer_id    :integer          not null
#  bearer_type  :string           not null
#  token_digest :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#
require "test_helper"

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

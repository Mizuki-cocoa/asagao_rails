class Duty < ApplicationRecord
    belongs_to :member, optional: true
end

class Todo < ApplicationRecord
    has_many :tasks, dependent: :destroy
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates_acceptance_of :human
end

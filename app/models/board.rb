class Board < ApplicationRecord

  has_many :tasks

  attr_accessor :query

end

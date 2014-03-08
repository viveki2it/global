class Employee < ActiveRecord::Base
  validates :email, :presence => true
  validates :rank, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, :presence => true
  validates :salary, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
end

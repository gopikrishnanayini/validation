class User < ActiveRecord::Base
	validates :age, inclusion: 1..100
	validates :firstname, length: { minimum: 4 }, uniqueness: true
	validates :lastname, presence: true
	validates :email, format: { with: /.>*@.*/ }
	validates :email, confirmation: true
end

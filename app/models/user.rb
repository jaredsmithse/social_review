class User < ActiveRecord::Base
	has_many :employees
	has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def update_reviews
  
  end
  
  def get_reviews

  end
end

class User < ActiveRecord::Base
	after_save :update_reviews

	has_many :employees
	has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def update_reviews
  	self.reviews.delete_all
  	response = HTTParty.get('https://api.foursquare.com/v2/venues/40a55d80f964a52020f31ee3?oauth_token=C552YRE13MWIXO2XM14YSKHT4LRHXABF2YE1FSEI53K4SFIZ&v=20131005')
  	response['response']['venue']['tips']['groups'][0]['items'].each do |review| 
  		new_review = Review.new()
  		new_review.body = review['text']
  		new_review.provider = "Foursquare"
  		new_review.date = review['createdAt']
  		new_review.likes = review['likes']['count']
  		new_review.save
  		self.reviews << new_review
  		get_sentiment(self.reviews.last.body, self.reviews.last)
  	end
  end

  private
  def get_sentiment(text, review)
  	alchemy = AlchemyAPI.new()
  	response = alchemy.entities('text', text, {'sentiment' => 1})

  	review.sentiment = alchemy.sentiment('text', text)['docSentiment']['type']
  	
  	response['entities'].each do |entity|
  		new_entity = Entity.new()
  		new_entity.relevance = entity['relevence']
  		new_entity.sentiment = entity['sentiment']['type']
  		new_entity.text = entity['text']
  		new_entity.save
  		review.entities << new_entity
  	end
  	review.save
  end
end

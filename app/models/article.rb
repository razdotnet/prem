class Article < ActiveRecord::Base


	belongs_to :user
	has_attached_file :attachment, styles: {medium: "300x300", thumb: "100x100"}
  	validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/	


	def self.top(limit)
		where(top: true).limit(limit)
	end
end
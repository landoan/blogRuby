class Article < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end

end

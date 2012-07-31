class Mapping

  include Mongoid::Document

  before_create :set_section

  field :mapping_id, :type => String
  field :reviews_count, :type => Integer, :default => 0
  field :section, :type => String

  has_many :reviews, dependent: :delete

  validates :mapping_id, :presence => true

  def set_section
    mapping = MigratoratorApi::Mapping.find_by_id(self.mapping_id)

    if mapping
      self.section = (mapping.tags.select {|t| t.match(/^section:/) }.first || "").sub(/^section:/, '')
    end
  end

  def set_reviews_count
    self.reviews_count = self.reviews.count
  end

  def set_reviews_count!
    set_reviews_count and save!
  end

end

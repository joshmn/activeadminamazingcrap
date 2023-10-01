class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(*args)
    self.columns_hash.keys
  end
  def self.ransackable_associations(*args)
    _reflections.keys
  end
end

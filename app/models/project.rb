class Project < ActiveRecord::Base
  has_many :media_objects, :dependent => :destroy
end

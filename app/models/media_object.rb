gem "ruby-fedora"
require "active-fedora"
require "builder"

include ActiveFedora
class MediaObject < ActiveFedora::Base

  include UuidHelper
  include Model
  
  has_relationship "parents", :is_part_of

  #Datastream to store Limecraft specific properties
  has_metadata :name => "metalime", :type => ActiveFedora::MetadataDatastream do |m|
    m.field "name", :string
    m.field "owner", :string
    m.field "restrictions", :text
  end

  #Datastream to store PMeta specific properties
  has_metadata :name => "p_meta", :type => ActiveFedora::MetadataDatastream do |m|
    m.field "p_meta_name", :string
  end

  #Datastream to store TVAnytime specific properties
  has_metadata :name => "tv_anytime", :type => ActiveFedora::MetadataDatastream do |m|
    m.field "tva_name", :string
  end

  #Datastream to store mpeg-7 specific properties
  has_metadata :name => "mpeg_7", :type => ActiveFedora::MetadataDatastream do |m|
    m.field "mpeg_7_name", :string
  end

  #Datastream to store dublin core specific properties
  has_metadata :name => "dublin_core", :type => ActiveFedora::QualifiedDublinCoreDatastream do |m|
    m.field "dc_name", :string, :xml_node => "source"
    m.field "date_recorded", :date, :xml_node => "date"
  end
  
  def to_fxml(options = {}, &block)
      builder = options[:builder]
      builder.media_object{
        builder.name(self.name)
        builder.owner(self.owner)
        builder.restrictions(self.restrictions)
      }
      
  end
  
  def name
    self.datastreams["metalime"].name_values
  end
  
  def owner
    self.datastreams["metalime"].owner_values
  end
  
  def restrictions
    self.datastreams["metalime"].restrictions_values
  end
  
end
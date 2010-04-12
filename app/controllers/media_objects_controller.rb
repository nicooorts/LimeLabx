require 'rubygems'
require 'uuidtools'
class MediaObjectsController < ApplicationController
  before_filter :require_fedora, :require_solr
  
  # GET /media_objects
  # GET /media_objects.xml
  # GET /media_objects.fxml
  def index
    @media_objects = MediaObject.find(:all)
    #@media_objects = ActiveFedora::SolrService.instance.conn.query('conforms_to_field:info\:fedora/afmodel\:MediaObject')
    if @media_objects.nil?
      puts "no objects found"
    else 
      puts @media_object.to_s
      @media_objects.each do |media_object|
        puts media_object.to_s
        puts media_object.name
        puts media_object.owner
        puts media_object.restrictions
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @media_objects }
      format.fxml  { render :fxml => @media_objects }
    end
  end

  # GET /media_objects/1
  # GET /media_objects/1.xml
  # GET /media_objects/1.fxml
  def show
    @media_object = MediaObject.find(params[:id])
    #puts @media_object
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media_object }
      format.fxml  { render :fxml => @media_object }
    end
  end

  # GET /media_objects/new
  # GET /media_objects/new.xml
  def new
    #@media_object = MediaObject.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media_object }
    end
  end

  # GET /media_objects/1/edit
  def edit
    @media_object = MediaObject.find(params[:id])
  end

  # POST /media_objects
  # POST /media_objects.xml
  # POST /media_objects.fxml
  def create
    #@media_object = MediaObject.new(params[:media_object])
    uuid = "uuid:" + UUIDTools::UUID.timestamp_create().to_s
    puts "creating object with id: " + uuid
    @media_object = MediaObject.new(:pid => uuid)
    meta_lime = @media_object.datastreams["metalime"]
    meta_lime.name_values << params[:name]
    meta_lime.owner_values << params[:owner]
    meta_lime.restrictions_values << params[:restrictions]

    respond_to do |format|
      if @media_object.save
        flash[:notice] = 'MediaObject was successfully created.'
        format.html { redirect_to(@media_object) }
        format.xml  { render :xml => @media_object, :status => :created, :location => @media_object }
        format.fxml  { render :fxml => @media_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media_object.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @media_object.errors }
      end
    end
  end

  # PUT /media_objects/1
  # PUT /media_objects/1.xml
  # PUT /media_objects/1.fxml
  def update
    #@media_object = MediaObject.find(params[:id])
    #@saved = @media_object.update_attributes(params[:media_object])
    @media_object = MediaObject.load_instance(params[:id])
    meta_lime = @media_object.datastreams["metalime"]
    meta_lime.name_values=(params[:name])
    
    respond_to do |format|
      #if @saved
      if @media_object.save
        flash[:notice] = 'MediaObject was successfully updated.'
        format.html { redirect_to(@media_object) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @media_object }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media_object.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @media_object.errors }
      end
    end
  end

  # DELETE /media_objects/1
  # DELETE /media_objects/1.xml
  # DELETE /media_objects/1.fxml
  def destroy
    @media_object = MediaObject.find(params[:id])
    @media_object.destroy

    respond_to do |format|
      format.html { redirect_to(media_objects_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @media_object }
    end
  end
end
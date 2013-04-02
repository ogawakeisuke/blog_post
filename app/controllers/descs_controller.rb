class DescsController < ApplicationController
  # GET /descs
  # GET /descs.json
  def index
    @descs = Desc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descs }
    end
  end

  # GET /descs/1
  # GET /descs/1.json
  def show
    @desc = Desc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @desc }
    end
  end

  # GET /descs/new
  # GET /descs/new.json
  def new
    @desc = Desc.new
    @phase_collection = Desc.phase_hashes
    @star_collection = Desc.star_hashes

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @desc }
    end
  end

  # GET /descs/1/edit
  def edit
    @desc = Desc.find(params[:id])
    @phase_collection = Desc.phase_hashes
    @star_collection = Desc.star_hashes
  end

  # POST /descs
  # POST /descs.json
  def create
    @desc = Desc.new(params[:desc])

    respond_to do |format|
      if @desc.save
        format.html { redirect_to @desc, notice: 'Desc was successfully created.' }
        format.json { render json: @desc, status: :created, location: @desc }
      else
        format.html { render action: "new" }
        format.json { render json: @desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /descs/1
  # PUT /descs/1.json
  def update
    @desc = Desc.find(params[:id])

    respond_to do |format|
      if @desc.update_attributes(params[:desc])
        format.html { redirect_to @desc, notice: 'Desc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descs/1
  # DELETE /descs/1.json
  def destroy
    @desc = Desc.find(params[:id])
    @desc.destroy

    respond_to do |format|
      format.html { redirect_to descs_url }
      format.json { head :no_content }
    end
  end

  def debugs
    @descs = Desc.all.each do |desc|
      desc.set_value_to_menu("ramen")
      desc.set_value_to_shop("toumeiya")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descs }
    end

  end


end

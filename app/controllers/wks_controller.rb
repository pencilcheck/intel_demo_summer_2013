class WksController < ApplicationController

  def status_update
    require 'json'
    values = params["wukong_status"].gsub("'", "\"").gsub(/"\z/, "").gsub(/\A"/, "").gsub(/u"/, "\"")
    logger.info values
    data = JSON.parse(values)
    logger.info data
    wukong = Wukong.create(data)
    render nothing: true, status: :ok
  end

  def network_init
    res = Wk_initialize.all.to_a

    respond_to do |format|
      format.json { render json: res }
      format.xml { render xml: res.to_xml(root: :nodes) }
    end
  end

  def network_info
    n = 1
    @nodes = []
    time = Wk.last.time
    while Wk.exists?
      new_node = Wk.last(n).first
      break if new_node.time != time
      @nodes << new_node
      n += 1
    end

    res = @nodes

    respond_to do |format|
      format.json { render json: res }
      format.xml { render xml: res.to_xml(root: :nodes) }
    end
  end

  def configuration
    min_version = params[:id]
    @state = State.find_by_id(min_version) if min_version.present?
    @last_state = State.last
    need_update = @state ? @state.id < @last_state.id : true

    res = {update: need_update, state: @last_state}

    respond_to do |format|
      format.json { render json: res }
      format.xml { render xml: res.to_xml(root: :wukong) }
    end
  end

  # GET /wks
  # GET /wks.json
  def index
    @wks = Wk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wks }
    end
  end

  # GET /wks/1
  # GET /wks/1.json
  def show
    @wk = Wk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wk }
    end
  end

  # GET /wks/new
  # GET /wks/new.json
  def new
    @wk = Wk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wk }
    end
  end

  # GET /wks/1/edit
  def edit
    @wk = Wk.find(params[:id])
  end

  # POST /wks
  # POST /wks.json
  def create
    @wk = Wk.new(params[:wk])

    respond_to do |format|
      if @wk.save
        format.html { redirect_to @wk, notice: 'Wk was successfully created.' }
        format.json { render json: @wk, status: :created, location: @wk }
      else
        format.html { render action: "new" }
        format.json { render json: @wk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wks/1
  # PUT /wks/1.json
  def update
    @wk = Wk.find(params[:id])

    respond_to do |format|
      if @wk.update_attributes(params[:wk])
        format.html { redirect_to @wk, notice: 'Wk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wks/1
  # DELETE /wks/1.json
  def destroy
    @wk = Wk.find(params[:id])
    @wk.destroy

    respond_to do |format|
      format.html { redirect_to wks_url }
      format.json { head :no_content }
    end
  end
end

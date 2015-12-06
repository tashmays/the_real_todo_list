class ListsController < ApplicationController
  def index
  	# GET
  	# shows all the items
  	@lists = List.all
  end

  def show
  	# GET
  	# showing a single item or shows more information
  	@list = List.find(params[:id])
  	@items = @list.items
  end

  def new
  	# GET
  	# rendering the form to create a new item
  	@list = List.new
  	#@items = @list.item
  end

  def create
  	# POST
  	# Creates the list and redirects the user
  	@list = List.new(list_params)
  		if @list.save
  			redirect_to lists_path
  		else
  			render :new
  		end
  end

  def edit
  	# GET
  	# reder the form so we can edit a single item
  	@list = List.find(params[:id])
  end

  def update
  	# PUT
  	# updating the list and redirecting the user
  	@list = List.find(params[:id])
  	if @list.update(list_params)
  		redirect_to list_path(@list)
  	else
			render :edit  	
		end
  end

  def destroy
  	# DELETE
  	# finds the item, and removes it from the database
  	list = List.find(params[:id])
  	if list.destroy
  		redirect_to lists_path
  	else
  		redirect_to lists_path(list)
  	end
  end

  private

  def list_params
  	params.require(:list).permit(:name)
  end
end

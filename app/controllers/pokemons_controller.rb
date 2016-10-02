class PokemonsController < ApplicationController

  def index
    @pokemon = Pokemon.all ##

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @pokemons }
    end
  end
  def show
    @pokemon = Pokemon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: '/' }
    end
  end
  def new
    @user = params[:user_id]
    @pokemon = Pokemon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @pokemon }
    end
  end
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        flash[:notice] = 'Pokemon was successfully created.'
        format.html { redirect_to(@pokemon) }
        format.xml  { render xml: @pokemon, status: :created, location: @pokemon }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @user = params[:user_id]
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    respond_to do |format|
      if @pokemon.update(pokemon_params)
        flash[:notice] = 'Pokemon was successfully updated.'
        format.html { redirect_to(@pokemon) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    respond_to do |format|
      format.html { redirect_to(pokemons_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :cp, :user_id)
  end
end

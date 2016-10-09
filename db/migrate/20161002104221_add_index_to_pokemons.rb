class AddIndexToPokemons < ActiveRecord::Migration[5.0]
  def change
    add_reference :pokemons, :user, foreign_key: true
  end
end

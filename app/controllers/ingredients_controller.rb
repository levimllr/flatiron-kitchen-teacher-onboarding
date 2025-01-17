class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :update]
    
    def index
        @ingredients = Ingredient.all
    end

    def show
    end
    
    def new
        @ingredient = Ingredient.new
        # binding.pry
    end

    def edit
    end

    def create
        # binding.pry
        ingredient = Ingredient.new(ingredient_params)
        
        if ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end
    end
    
    def update
        @ingredient.update(ingredient_params)

        if @ingredient.save
            redirect_to ingredients_path
        else
            render :edit
        end
    end

    def destroy

    end

    private

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end

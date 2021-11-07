class PlantsController < ApplicationController

    #GET request to get all plants from a database:
    def index 
        plants = Plant.all
        render json: plants 
    end

    #GET individual record/plant from a database: 
    def show 
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "plant is not found"}, status: :not_found
         end 
        end
    #POST / create a new record in the database 

    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created 
    end 

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
   
end

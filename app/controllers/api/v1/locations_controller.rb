module API
  module V1
        class  Api::V1::LocationsController < ApplicationController
      
        def index
            locations = Location.order('created_at DESC');
            render json: {status: "SUCCESS" , message: "Loaded location", data: locations},status: :ok
        end  

        def show
            location = Location.find(params[:id])
            render json: {status: "SUCCESS" , message: "Loaded location", data: location},status: :ok
        end

        def create
          location = Location.new(location_params)
            if location.save
            render json: {status: "SUCCESS" , message: "saved location", data: location},status: :ok
          else
             render json: {status: "ERROR" , message: "location not saved", data: location.errors},status: :unprocessable_entity
          end
        end


     def destroy

         location = Location.find(params[:id])

          location.destroy

          render json: {status: "SUCCESS" , message: "Deleted Location", data: location},status: :ok

        end

 

        def update

          location = Location.find(params[:id])

          if location.update_attributes(location_params)

           render json: {status: "SUCCESS" , message: "UPDATE SUCCESS", data: location},status: :ok

          else

           render json: {status: "ERROR" , message: "UPDATE FAIL", data: location.errors},status: :unprocessable_entity

          end

        end

 

        private

        def location_params

          params.permit(:address, :latitude, :longitude)

        end


   end
  end
end
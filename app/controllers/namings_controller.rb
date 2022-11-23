class NamingsController < ApplicationController
    def index 
        @namings = Naming.all 
    end 

    def show 
        @naming = Naming.find(params[:id])
    end 

    def new 
        @naming = Naming.new 
    end 

    def create 
        @naming = Naming.create(naming_params)

        if @naming.save 
            redirect_to namings_path 
        else 
            render :new 
        end 
    end 

    def to_file 
        if File.exists?("naming.txt")
            @file = File.open("naming.txt", "a")
        else 
            @file = File.new("naming.txt", "w")
        end 
        @file.puts("#{naming_params[:tbox1]}" , "#{naming_params[:tbox2]}")
        @file.close
    end 

    def save 
        @naming = create()
        @naming = to_file()
    end 

    def destroy 
        @naming = Naming.find(params[:id])
        @naming.destroy 

        redirect_to namings_path 
    end 

    private 
    def naming_params
        params.require(:naming).permit(:tbox1, :tbox2)
    end 
end

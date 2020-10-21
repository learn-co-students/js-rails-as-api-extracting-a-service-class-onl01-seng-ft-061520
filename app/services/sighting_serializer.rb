class SightingSerializer
    #whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting. 
    #We will need access to this variable elsewhere in the SightingSerializer, so an instance variable is needed here.
    #The second step is to write a method that will call to_json on this instance variable, handling the 
    #inclusion and exclusion of attributes, and return the results. We will call this method to_serialized_json, 
    #and for now we can directly copy the to_json logic that currently exists in SightingsController:
    
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    # def to_serialized_json
    #     @sighting.to_json(:include => {
    #     :bird => {:only => [:name, :species]},
    #     :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    # end

#In the to_serialized_json method, we are passing multiple options into to_json when it is called. These options are just key/value pairs in a hash, though, and we can choose to break this line up to get a better grasp of what is actually going on. Rewriting the method without changing any functionality, we could write:
#we define a variable, options, assigning it to a hash. We then define two keys on that hash, :include and :except, and assign them the same values as before. Finally, at the end of the method, instead of filling to_json with a long list of options, we pass in the options hash.
    def to_serialized_json
    options = {
        include: {
        bird: {
            only: [:name, :species]
        },
        location: {
            only: [:latitude, :longitude]
        }
        },
        except: [:updated_at],
    }
    @sighting.to_json(options)
    end
end
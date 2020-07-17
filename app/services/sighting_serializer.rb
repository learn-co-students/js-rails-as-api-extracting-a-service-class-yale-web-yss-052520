class SightingSerializer
    def initialize(sighting_object)
        # need to store args as instance variable for access later in to_serialized_json
      @sighting = sighting_object
    end
   
    # can call on instance once created to get data customized and ready to go as a JSON string
    def to_serialized_json
        # @sighting.to_json(:include => {
        #   :bird => {:only => [:name, :species]},
        #   :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])

        # same as above, but rewritten to better understand what is actually going on
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
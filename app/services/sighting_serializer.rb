class SightingSerializer
  def initialize(sighting_object)
    @sighting = sighting_object
  end
  # we use the initialize method to set up any instance variables that we might want to share over multiple methods.
  # in this case, initialize will take in whatever variable we're dealing with n a particular action, and store it as
  # an instance variable

  def to_serialized_json
    options = {
      include: {
        bird: {
          only: %i[name species]
        },
        location: {
          only: %i[latitude longitude]
        }
      },
      except: [:updated_at]
    }
    @sighting.to_json(options)
end
  # with this setup, once an instance of SightingSerializer is created, we can call to_serialized_json on it to get our
  # data customized and ready to go as a JSON string
end

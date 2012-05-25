module Brewser
  class Recipe < Model
    belongs_to :batch
    
    property :date_created, Date
    property :name, String, :required => true
    property :description, String, :length => 65535

    property :type, String, :set => ['Ale', 'Lager', 'Wheat', 'Cider', 'Mead', 'Hybrid']
    property :method, String, :set => ['Extract', 'Partial Mash', 'All Grain'], :required => true
    
    has 1, :style
    validates_presence_of :style
    
    property :brewer, String
    property :recipe_volume, Volume, :required => true
    property :boil_volume, Volume, :required => true
    property :boil_time, Time, :required => true
    property :recipe_efficiency, Float
    validates_presence_of :recipe_efficiency, :if => proc { |t| t.method != 'Extract' }

    has n, :hops
    has n, :fermentables
    has n, :additives
    has n, :yeasts
    
    has 1, :mash_schedule
    has 1, :fermentation_schedule
    has 1, :water_profile

    property :asst_brewer, String
    property :taste_notes, String, :length => 65535
    property :taste_rating, Float
    
    property :estimated_og, Float
    property :estimated_fg, Float
    property :estimated_color, Float
    property :estimated_ibu, Float
    property :estimated_abv, Float
    
    property :source, String, :length => 65535
    property :url, String, :length => 65535
        
    property :carbonation_level, Float
  
    validates_presence_of :mash_schedule, :if => proc { |t| t.method != 'Extract' }
    
  end

end
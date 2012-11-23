# Survival

Functions related to survival analysis, such as Kaplan-Meier estimator of survival curves.

## Installation

Add this line to your application's Gemfile:

    gem 'survival'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install survival

## Usage

To generate a Kaplan-Meier survival curve:

    #survivals is an array of hashes. Each hash represents a sample, and must define 
    #   :event (the event time)
    #   :censored (boolean describing whether this sample is right-censored)
    survivals = [{:event => 21, :censored => false}, {:event => 13, :censored => true}, ... ]
    survival_objs = SurvivalSample.create_survival_objects(survivals) #Create survival sample objects
    points = KaplanMeier.generate_plot_points(survival_objs) #Generate the x,y coordinates of the survival curve

    #points is an array of [x,y] pairs for plotting. Use your favorite plotting library to plot the line graph.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

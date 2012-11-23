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

To generate a Kaplan-Meier survival plot:

    #survivals is an array of hashes. Each represents a sample, and must define :event (the event time) and :censored (boolean describing whether this sample is censored)
    points = KaplanMeier.generate_plot_points(SurvivalSample.create_survival_objects(survivals))

    #points is an array of [x,y] pairs for plotting. Use your favorite plotting library to plot the line graph.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

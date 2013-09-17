#########################################
#
# Object for holding survival data.
#
# Roman Eisner
#
#########################################

class SurvivalSample

  attr_accessor :censored, :event

  def initialize(censored, event)
    @censored = censored
    @event = event
  end

  def to_s
    "Survival: {Event: #{@event}, Censored: #{@censored}}"
  end

  #Sort method:
  def <=>(o)

    if self.event != o.event
      return self.event <=> o.event
    else
      if (self.censored == o.censored)
        return 0
      elsif self.censored
        return 1
      else
        return -1
      end
    end

  end

  #Takes an array of Survival objects, and returns a binned hash.
  def SurvivalSample.bin_survivals(survs)
    bins = Hash.new

    survs.each do |s|
      bins[s.event] ||= Array.new

      bins[s.event] << s
    end

    return bins
  end

  #Takes an array of hashes, each has must have two keys:
  # :event => The event time
  # :censored => A boolean, true if this patient has been right-censored.
  def SurvivalSample.create_survival_objects(surv_array)
    return surv_array.map { |s| SurvivalSample.new(s[:censored], s[:event]) }
  end

end
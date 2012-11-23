#########################################
#
# Creates a survival plot using the
# Kaplan-Meier method.
#
#########################################

class KaplanMeier

  #Creates the x,y pairs for plotting a survival curve, 
  #using the Kaplan-Meier method.
  def self.generate_plot_points(survivals)

    bins = SurvivalSample.bin_survivals(survivals)

    points = [[0,100]]
    median = nil

    terms = Array.new
    n = survivals.length #Number we are considering at this time point (total surviving minus censored)
    prev = 100
    bins.keys.sort.each do |t|

      survs = bins[t]

      #Update counts for this time point
      d = 0 #Number that have died at this time point
      survs.each do |s|
        n = n-1 

        if not s.censored
          d = d + 1
        end
      end

      #Calculate the probability of survival for this time point
      s_t = 1
      terms.each do |term|
        s_t = s_t * term
      end

      curr_term = (n - d).to_f / n
      terms << curr_term

      s_t = s_t * 100.0

      #The median survival time is calculated as the smallest survival time 
      #for which the survivor function is less than or equal to 0.5
      if ( (s_t <= 50.0) && (median.nil?) ){
        median = t
      }

      #Add to plot points
      points << [t, prev] #Horizontal line from previous point
      points << [t, s_t] #Current point
      prev = s_t

    end

    return points, median
  end

end

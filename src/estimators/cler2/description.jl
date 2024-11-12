name( ::Val{:cler2} ) = "Conformant Likelihood with Exogeneity Restrictions"


function Description( e :: Symbol, v ::Val{ :cler2 } )
    @ensure e == :cler2 "oops!"
    return EstimatorDescription( e, name( Val( :cler2 ) ), 
      [ "cler2"]
      )
end




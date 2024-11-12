struct GrumpsCLER2Estimator <: GrumpsPenalized
    function GrumpsCLER2Estimator() 
        new()
    end
end


name( ::GrumpsCLER2Estimator ) = name( Val( :cler2 ) )

inisout( ::GrumpsCLER2Estimator ) = true
iopattern( ::GrumpsCLER2Estimator ) = "111111"

Estimator( ::Val{ :cler2 } ) = GrumpsCLER2Estimator()


const GrumpsCLER2EstimatorInstance = GrumpsCLER2Estimator()


function DetailedDescription( e :: GrumpsCLER2Estimator )
    io = IOBuffer()
    print( io, EstColor, "The estimator used here is the ", EmColor, "Conformant Likelihood with Exogeneity Restrictions estimator. ", EstColor,
            "It minimizes an objective function of the form ", MathColor,
            "Ω̂( θ, δ, β ) = ℒ ᵐⁱᶜ( θ, δ ) + ℒ ᵐᵃᶜ( θ, δ ) + Π( δ, β ) " , EstColor,
            "where the first two components are (minus) a micro likelihood and a macro likelihood ", 
            "and the last component is a GMM style objective function. ",
            "This is the full version of this estimator which takes longer to compute than the ",
            "asymptotically equivalent cheap version.  The main advantage of the full CLER2 estimator ",
            "compared to the cheap version is that there is somewhat greater robustness to small shares.", Reset )
    return String( take!( io ) )
end

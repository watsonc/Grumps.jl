

"""
OutsideObjective1!(  
    fgh         :: GrumpsSingleFGH{T}, 
    θ           :: Vec{T},
    δ           :: Vec{T},
    e           :: GrumpsCLER2Estimator, 
    d           :: GrumpsMarketData{T}, 
    o           :: OptimizationOptions, 
    s           :: GrumpsMarketSpace{T}, 
    m           :: Int,
    computeF    :: Bool, 
    computeG    :: Bool, 
    computeH    :: Bool 
    )

Outside single market objective function for the CLER2 Estimator.  
Since the inside and outside objective functions coincide there is no
reason to recompute Ωδδ, Ωδθ
"""
function  OutsideObjective1!(  
    fgh         :: GrumpsSingleFGH{T}, 
    θ           :: Vec{T},
    δ           :: Vec{T},
    e           :: GrumpsPenalized,
    d           :: GrumpsMarketData{T}, 
    o           :: OptimizationOptions, 
    s           :: GrumpsMarketSpace{T}, 
    m           :: Int,
    computeF    :: Bool, 
    computeG    :: Bool, 
    computeH    :: Bool 
    ) where {T<:Flt}


    F1 = MacroObjectiveθ!( 
        grif( computeF, fgh.F[1] ),
        grif( computeG, fgh.Gθ ),
        grif( computeH, fgh.Hθθ ),
        grif( computeH, fgh.Hδθ ),
        θ,
        δ,
        d.macrodata,
        s.macrospace,
        o,
        m,
        true
         ) 

	if !isnothing(d.microdata)
		F2 = MicroObjectiveθ!( 
		    F1,
		    grif( computeG, fgh.Gθ ),
		    grif( computeH, fgh.Hθθ ),
		    grif( computeH, fgh.Hδθ ),
		    θ,
		    δ,
		    d.microdata,
		    s.microspace,
		    o,
		    m,
		    false
		    )
	else
		F2 = 0
	end
		
    if computeF
        fgh.F .= F2
    end

    return F2
end

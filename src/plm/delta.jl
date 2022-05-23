@todo 4 "InsideObjective1! needs to be redone for plm"

function  InsideObjective1!( 
    F       :: FType{T}, 
    G       :: GType{T}, 
    Hδδ     :: HType{T}, 
    Hδθ     :: HType{T},
    θ       :: Vec{T},
    δ       :: Vec{T}, 
    e       :: GrumpsPLMEstimator, 
    d       :: GrumpsMarketData{T}, 
    o       :: OptimizationOptions, 
    s       :: GrumpsMarketSpace{T}, 
    m       :: Int = 0
    ) where {T<:Flt}
    
    F1 = MacroObjectiveδ!( 
        F,
        G,
        Hδδ,
        δ,
        d.macrodata,
        s.macrospace,
        o,
        true
         ) 
      

    F2 = MicroObjectiveδ!( 
        F1,
        G,
        Hδδ,
        δ,
        d.microdata,
        s.microspace,
        o,
        false               # this is to indicate that things shouldn't be set to zero
         ) 
    
    return F2
end


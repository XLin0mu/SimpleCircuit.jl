
"""
    PureWire

    Purely wire object without resistance or timelag.
"""
struct PureWire <: CircuitObjects
    innode::Symbol
    outnode::Symbol
end

"""
    Wire

    Timelag is based on HPTime(High-precision Time) implemented by Attosecond.jl
"""
struct Wire <: CircuitObjects
    pw::PureWire
    lag::WireLag    = HPTime(0)
    r::Resistance   = Resistance(0)
end

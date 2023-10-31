
"""
    PowerSource{T}

    T=Volt for Volt source.
    T=Current for Current source.
"""
abstract type PowerSource{T} <: CircuitObjects end

"""
    IdealPowerSource{T}

    T=Volt for Volt source.
    T=Current for Current source.
"""
abstract type IdealPowerSource{T} <: PowerSource{T} end

struct IdealCurrentSource <: IdealPowerSource{Current}
    c::Current
end
ICS(x::Number) = IdealCurrentSource(Current(x))

struct IdealVoltSource <: IdealPowerSource{Volt}
    v::Volt
end
IVS(x::Number) = IdealVoltSource(Volt(x))

struct CurrentSource <: PowerSource{Current}
    ics::IdealCurrentSource
    r::Resistance
end
CS(ics::Number, r::Number) = CurrentSource(ICS(ics), R(r))

struct VoltSource <: PowerSource{Volt}
    ivs::IdealVoltSource
    r::Resistance
end
VS(ivs::Number, r::Number) = VoltSource(IVS(ivs), R(r))
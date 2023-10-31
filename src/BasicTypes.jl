#using Attosecond

abstract type AbstracCircuit end

abstract type CircuitAsignments end

for T in (:Current, :Volt, :Resistance)
    @eval struct $T <: CircuitAsignments
        value::Float64
        $T(v::Number) = new(v)
    end
    @eval Symbol(String(Symbol($T))[1])() = $T
end

"""
    COP(CircuitObjectPropagation)

    A function which accept input from Wire or CircuitObject
"""
abstract type CircuitObjectPropagation <: Function end
COP = CircuitObjectPropagation

"""
    CO(CircuitObject)

    A object in circuit.
"""
abstract type CircuitObjects end




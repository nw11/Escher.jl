# Length

using JSON

export mm, inch, pt, px, pc

immutable Length{unit}
    value::Float64
end

const mm = Length{:mm}(1.0)
const inch = Length{:inch}(1.0)
const pt = Length{:pt}(1.0)
const px = Length{:px}(1.0)
const pc = Length{:pc}(1.0)

*{T <: Length}(l::T, n::Real) = T(n * l.value)
*(n::Real, l::Length) = l * n
/{T <: Length}(l::T, n::Real) = T(l.value / n)
+{T <: Length}(l::T, r::T) = T(l.value + r.value)
-{T <: Length}(l::T, r::T) = T(l.value - r.value)

Base.string{unit}(x::Length{unit}) = string(x.value, unit)
Base.string(x::Length{:pc}) = string(x.value, '%')
JSON._print(io::IO, ::JSON.State, x::Length) = Base.print(io, "\"", string(x), "\"")

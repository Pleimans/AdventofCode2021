function increases(inputs::Vector{Int})::Int
    sum(map((x, y) -> x < y ? 1 : 0, inputs[1:end-1], inputs[2:end]))
end

function sumincreases(inputs::Vector{Int})::Int
    l = map((x, y, z) -> x + y + z, inputs[1:end-2], inputs[2:end-1], inputs[3:end])
    increases(l)
end

function dayone(filename::String)::Nothing
    open(filename) do f
        inputs = [parse(Int, x) for x in readlines(f)]
        println("Number of increases: $(increases(inputs))")
        println("Number of increases in sums of three: $(sumincreases(inputs))")
    end
    nothing
end

dayone("input.txt")
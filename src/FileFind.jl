module FileFind
	using Base

	include(joinpath(julia_pkgdir(), "FileFind", "src", "find.jl"))
end

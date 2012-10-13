load("find.jl")

function file_name_and_size(filename)
  println(strcat(filename, " ", filesize(filename)))
end

file_find(file_name_and_size, ".")

total_bytes = 0

function total_size(filename)
  global total_bytes
  total_bytes += filesize(filename)
end

file_find(total_size, ".")

total_bytes

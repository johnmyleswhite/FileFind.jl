load("FileFind")

# The simplest scenario possible
FileFind.find()

# Specifying a directory explicitly
FileFind.find(".")

# Specifying a function explicitly
FileFind.find(fn -> println(isfile(fn)))

# Specifying both a directory and a function explicitly
function file_name_and_size(filename)
  println(strcat(filename, " ", filesize(filename)))
end
FileFind.find(".", file_name_and_size)

# Using a closure to maintain global state across function calls
total_bytes = 0

function total_size(filename)
  global total_bytes
  total_bytes += filesize(filename)
end

FileFind.find(".", total_size)

total_bytes

function find(dirname::String, f::Function)
  if !isdir(dirname)
    error("find() can only be called on directories")
  end

  starting_dir = pwd()

  cd(dirname)

  for filename in readdir(".")
    f(abspath(filename))
    if isdir(filename) && !islink(filename)
      find(filename, f)
    end
  end

  cd(starting_dir)
end

find(dirname::String) = find(dirname, println)
find(f::Function) = find(".", f)
find() = find(".", println)

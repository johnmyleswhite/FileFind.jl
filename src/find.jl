function find{T <: String}(dirname::T, f::Function)
  if !isdir(dirname)
    error("find() can only be called on directories")
  end

  starting_dir = cwd()

  cd(dirname)

  for filename in readdir(".")
    f(abs_path(filename))
    if isdir(filename) && !islink(filename)
      find(filename, f)
    end
  end

  cd(starting_dir)
end

find{T <: String}(dirname::T) = find(dirname, println)
find(f::Function) = find(".", f)
find() = find(".", println)

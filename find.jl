function file_find{T <: String}(f::Function, dirname::T)
  if !isdir(dirname)
    error("file_find can only be called on directories")
  end

  starting_dir = cwd()

  cd(dirname)

  for filename in readdir(".")
    f(abs_path(filename))
    if isdir(filename) && !islink(filename)
      file_find(f, filename)
    end
  end

  cd(starting_dir)
end

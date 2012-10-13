# Minimal Implementation of Perl's File::Find in Julia

This package provides a single function, `file_find`, that:

* Performs a depth-first search of a directory starting at `dir_name`.
* Calls a function `f` on every file/directory encountered along the way.
* Avoids following symlinks to prevent cycles.

# Usage Examples

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

# To Do

Implement desired functionality from File::Find:

* Non-cyclic symlink following.
* Preorder vs. postorder calls to `f`.

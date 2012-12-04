# Minimal Implementation of Perl's File::Find in Julia

This package provides a single function, `FileFind.find`, which:

* Performs a depth-first search of a directory starting at `dir_name`
* Calls a function `f` on every file/directory encountered along the way
* Does not follow symlinks to prevent cycles

# Usage Examples

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

# To Do

* Implement missing functionality from Perl's File::Find
    * Non-cyclic symlink following
    * Preorder vs. postorder calls to input function

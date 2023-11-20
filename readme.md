# AoC File tree generator!

> It's that time of year again...or it's that whole year again!

This is a simple program that generates a file tree of each year (between input years),  
and their respective days. The days include a solution template, and a testing template.  
The default template uses the **pytest** library, but the code inside the templates is what  
will be copied, so it can be edited as needed or desired.

Setup:

1. Download.
2. Edit templates to your specs.
3. Run `create_file_structure.py` or `generate.sh` and input your desired years to generate
4. If using `generate.sh`, you can enter a file extentsion if your templates are not .py files

#### Important!

`create_file_structures.py` and `generate.sh` creates the file tree in the *directory above the one it's in*, so if  
run in `C:/.../root/generator_files/create_file_structure.py`, it will create the tree in `C:/.../root/`  

Happy Holidays!

Possible features to implement:
1. ~~Pulling and updating input.txt directly from site.~~
  ~~-Populating docstrings with the problem from site as well.~~
  *AoC's creator suggests against adding this in packages, so I will refrain from adding.* 
3. Support for other languages. (use regex matching and supported filetypes)
4. Fancier readme

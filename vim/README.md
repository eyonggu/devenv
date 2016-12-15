vim
======

1) How to apply vim environment on new machine
   See setup.sh

2) Install plugin as submodules
   1. cd ~/.vim
   2. git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
   3. git add .
   4. git commit -m "Install Fugitive.vim bundle as a submodule."

2) Plugin Introduction:

  pathogen.vim
     Manage your 'runtimepath' with ease. 
     In practical terms, pathogen.vim makes it super easy to install 
     plugins and runtime files in their own private directories.
     Any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, 
     and they will be added to the 'runtimepath'

  

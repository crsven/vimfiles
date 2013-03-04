au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.coffee.js set filetype=coffee
au BufRead,BufNewFile *.slim set filetype=slim

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile Capfile set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

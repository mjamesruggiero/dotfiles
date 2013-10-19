#!/usr/bin/env ruby

git_bundles = %w{
  git://github.com/scrooloose/nerdtree.git
  git://github.com/tpope/vim-fugitive.git
  git://github.com/tpope/vim-haml.git
  git://github.com/tpope/vim-rails.git
  git://github.com/tpope/vim-repeat.git
  git://github.com/tpope/vim-surround.git
  git://github.com/tsaleh/vim-matchit.git
  git://github.com/msanders/snipmate.vim.git
  git://github.com/nvie/vim-flake8.git
  git://github.com/alfredodeza/pytest.vim.git
  git://git.wincent.com/command-t.git
  git://github.com/derekwyatt/vim-scala.git
  git://github.com/tpope/vim-foreplay.git
  git://github.com/tpope/vim-classpath.git
  git://github.com/guns/vim-clojure-static.git
  git://github.com/rking/ag.vim
  git://github.com/scrooloose/nerdcommenter.git
  git://github.com/kchmck/vim-coffee-script.git
  git://github.com/tpope/vim-fireplace.git
  git://github.com/thoughtbot/vim-rspec.git
}

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)
FileUtils.cd(bundles_dir)

git_bundles.each do |url|
  puts url
  `git clone -q #{url}`
end

Dir["*/.git"].each {|f| FileUtils.rm_rf(f) }


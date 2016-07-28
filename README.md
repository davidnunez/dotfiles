**Table of Contents**

- [Synopsis](#synopsis)
    - [Do everything](#do-everything)
    - [Usage](#usage)
    - [Maintenance](#maintenance)
    - [Why not just use dotfiles?](#why-not-just-use-dotfiles)
- [Exactly what does `./install` do?](#exactly-what-does-install-do)
    - [Environment: `~/env`](#environment-env)
    - [Utilities: `~/bin`](#utilities-bin)
- [Exactly what does `setup all` install?](#exactly-what-does-setup-all-install)
- [License](#license)

# Synopsis
I hate installing, configuring, and updating software on my computer. Especially when I'm using a new machine, or sshing into a remote system. I've automated as much of that process as I can, keeping everything as lightweight as possible.

## Do everything

Just configure and install all of it:

```bash
git clone https://github.com/lexicalunit/setup.git
setup/install
setup/bin/setup -f all
```

If you don't even have `git` yet, try something like:

```bash
curl -LOks https://github.com/lexicalunit/setup/tarball/master
mkdir setup && tar xvzf master --strip 1 -C setup
setup/install
setup/bin/setup -f all
```

## Usage
1. Clone this repository, change directories into it, and then run [`./install`](install). This will setup your environment (dotfiles and other items) and [`~/bin`](bin) directory and scripts.
1. Source your new environment by opening a new terminal or running [`. ~/.profile`](env/dot_profile).
1. Execute the command [`setup all`](bin/setup) to step through configuration of system settings, installation of applications, and creation of your complete OS X developer environment.

You can also use the root level [`deploy`](deploy) script to automatically run the root level [`install`](install) script on a remote host. If you want to also remotely run [`bin/setup`](bin/setup), you will have to do that by hand as it's an occasionally interactive script.

You can uninstall everything that the root level [`install`](install) script installs by running the root level [`uninstall`](uninstall) script. This won't uninstall anything that you might have installed by running the [`bin/setup`](bin/setup) script.

## Maintenance
* The root level [`update`](update) script can be used periodically to update this repository with any changes made to the system scripts or environment.
* Re-run [`setup all`](bin/setup) to update applications and ensure environment settings are configured properly.
* If you cloned this repository, don't forget to `git pull` any updates!

## Why not just use dotfiles?
Github [dotfiles](http://dotfiles.github.io/) is really neat, but it doesn't go far enough for my purposes. I wanted a single command, [`setup all`](bin/setup) to just *do everything* for me with minimal interaction. I also wanted to be able to update and deploy my settings with similar ease. Some of the code in this repository is based on existing [dotfiles](http://dotfiles.github.io/), so you can think of this as a meta-dotfiles repository, tailored to my tastes. It may be possible to clean up this codebase using tools like [fresh](https://github.com/freshshell/fresh), and it may be possible to refactor it as a fork of [dotfiles](http://dotfiles.github.io/). The exploration of these possibilities is left as an exercise to the reader.

# Exactly what does `./install` do?

The root level [./install](install) script configures your environment, much like [dotfiles](http://dotfiles.github.io/) would. Additionally it installs a number of utilities into your `~/bin` directory. One of those utilities is the amazingly wonderful [`~/bin/setup`](bin/setup) tool for which this repository is named.

## Environment: `~/env`
Provides installation and configuration of many utilities and applications. Running [`env/install`](env/install) will provide the following features, as well as additional configuration. For more details on what is provided see [the `README.md` for [`~/env`](env)](env/README.md).
* [`My.terminal`](env/My.terminal) and [`Tomorrow Night.terminal`](env/Tomorrow Night.terminal) themes to use in `Terminal.app` or [`iTerm.app`](http://iterm2.com/).
* Application configuration such as Atom and Sublime Text settings.
* Dot files for zsh, bash, dircolors, git, mercurial, vim, python, etc...
* [`sane.css`](env/sane.css) style sheet for annoying websites.

## Utilities: `~/bin`
The following tools are installed into your [`~/bin`](bin) directory by the root
 level [`install`](install) script, or by the [`bin/install`](bin/install)
script. These tools will be on your `PATH` if you have ran the root level
[`install`](install) script or the [`env/install`](env/install) script. For
detailed usage documentation see the [`README.md` for `~/bin`](bin/README.md),
or of course just run the tools with the argument `--help`.

| Tool | Usage |
| --- | --- |
| [`addroot`](bin/addroot) | Crazy hack to Add Root Folder to Atom. |
| [`alert`](bin/alert) | Provides shell level windowed alerting system. |
| [`api`](bin/api) | Requests a web API resource and pretty prints resulting JSON. |
| [`apmpull`](bin/apmpull) | Updates atom packages that are installed via git cloning them into ... |
| [`bluetooth_reset`](bin/bluetooth_reset) | Resets bluetooth on OS X. |
| [`capture`](bin/capture) | Creates a screenshot of selected window on X11. |
| [`colortest`](bin/colortest) | Prints out an entire color palette of terminal color codes. |
| [`daemons`](bin/daemons) | Finds and removes unwanted daemons and agents. |
| [`die`](bin/die) | Kills processes based on process name. |
| [`doc`](bin/doc) | Builds HTML output from Markdown file. |
| [`fa`](bin/fa) | Searches a codebase for given pattern. |
| [`fart`](bin/fart) | Sleeps for the given number of seconds, showing a progress bar. |
| [`flip`](bin/flip) | Flips input upside down. |
| [`fm`](bin/fm) | Find in CMake files. |
| [`git_authors`](bin/git_authors) | Git script for discovering who wrote the code at the current workin... |
| [`git_ltr`](bin/git_ltr) | Lists (a-la 'ls -ltr') git controlled source files in current direc... |
| [`git_name_change`](bin/git_name_change) | Clones a repo then changes the name and email address in entire his... |
| [`git_push_topic`](bin/git_push_topic) | Force updates remote topic branch with local branch. |
| [`git_reauthor`](bin/git_reauthor) | In git, change the author name and/or email of a single commit. |
| [`install`](bin/install) | Installs everything to ~/bin. |
| [`install_mysql`](bin/install_mysql) | Installs/uninstalls mysql from package. |
| [`jsc`](bin/jsc) | Symbolic link to '/System/Library/Frameworks/JavaScriptCore.framewo... |
| [`lt`](bin/lt) | Run shell command with a timeout. |
| [`macosver`](bin/macosver) | Prints current OS X version information. |
| [`nopw`](bin/nopw) | Enables password-less ssh TO username@remotehost FROM localhost. |
| [`readmeize`](bin/readmeize) | Prepares given image for use in a README.md file. |
| [`root`](bin/root) | Prints the root of the current repository. |
| [`s`](bin/s) | Show git status for all directories in current directory. |
| [`safari_cache`](bin/safari_cache) | Shows current Safari cache. |
| [`safari_clean`](bin/safari_clean) | Cleans Safari caches and saved data on OS X. |
| [`setup`](bin/setup) | Install applications and development environment on an OS X machine. |
| [`setup_odbc`](bin/setup_odbc) | Sets up ODBC. |
| [`share`](bin/share) | Easy way to quickly manage temporary web shares. |
| [`slept`](bin/slept) | Get time OS X system last went to sleep. |
| [`smongo`](bin/smongo) | Opens mongo shell to master node. |
| [`uninstall_homebrew`](bin/uninstall_homebrew) | Uninstalls Homebrew completely. |
| [`uninstall_macports`](bin/uninstall_macports) | Uninstalls MacPorts completely. |
| [`update_bin`](bin/update_bin) | Syncs ./bin with ~/bin. |
| [`usages`](bin/usages) | Prints out documentation and usages for utilities. |
| [`woke`](bin/woke) | Get time OS X system last woke from sleep. |
| [`xdie`](bin/xdie) | Kills processes based on their window title. |
| [`xf`](bin/xf) | Extract common file formats. |
| [`yaml2json`](bin/yaml2json) | Converts yaml input to json output. |
| [`youtube2mp3`](bin/youtube2mp3) | Downloads the audio from a youtube video given the URL. |

# Exactly what does `setup all` install?
Glad you asked! `setup all` will go through all of the following steps one by
one. For each step that installs a number of packages/formulas/casks/whatever,
see below for the list of items that will be installed when that step runs.

| Step | Description |
| --- | --- |
| osx | Override OS X defaults settings and configuration |
| xcode | Ensure that Xcode Command Line Tools are installed |
| java | Ensure that Apple's java for OS X is installed |
| brew | Ensure Homebrew installed and formulas upgraded |
| cask | Ensure Homebrew Casks are installed |
| atom | Ensure Atom installed via Homebrew Cask and apm packages are upgraded |
| zsh | Ensure shell is latest version of zsh from Homebrew |
| python | Upgrade/Install Anaconda, pip packages, and conda packages |
| gem | Upgrade/Install gem packages and rubygems-update package |
| node | Ensure Node modules are installed |

Homebrew Formulas: autoconf, automake, bash, bison, boost, cloog, cmake, 
coreutils, cppunit, dmd, docker, docker-compose, docker-machine, doxygen, 
erlang, faac, ffmpeg, fontconfig, freetype, gd, gdbm, geoip, gettext, 
ghostscript, gifify, gifsicle, git, git-review, glib, gmp, gmp4, gnu-sed, 
gnu-tar, gnupg, go, gradle, htop-osx, id3lib, id3v2, imagemagick, isl, jasper, 
jbig2dec, jhead, jo, jpeg, jq, lame, libevent, libffi, libgpg-error, 
libgphoto2, libicns, libksba, libmpc, libpng, libssh2, libtiff, libtool, 
libusb, libusb-compat, libvo-aacenc, libyaml, little-cms2, lzlib, makedepend, 
maven, md5sha1sum, memcached, mercurial, mongodb, mpfr, mysql, ncftp, nginx, 
node, onepass, oniguruma, openssl, ossp-uuid, pandoc, pcre, pidof, pkg-config, 
plotutils, pngquant, postgresql, rabbitmq, readline, redis, rust, s3cmd, 
sane-backends, scons, sdl2, sdl2_image, shellcheck, sloccount, spark, sqlite, 
sqliteodbc, storm, swig, tree, unixodbc, unrar, vramsteg, watch, webp, wget, 
wxmac, x264, xvid, xz, yaml-cpp, youtube-dl, z, zeromq, zookeeper, zsh

Homebrew Casks: 1password, adium, amazon-music, atom, audacity, 
balsamiq-mockups, battle-net, caffeine, clamxav, cyberduck, dbvisualizer, 
disk-inventory-x, dropbox, evernote, fantastical, firefox, flux, google-chrome, 
google-hangouts, hipchat, iexplorer, istumbler, iterm2, java, kaleidoscope, 
lingon-x, lisanet-gimp, mactex, mysqlworkbench, oclint, robomongo, silverlight, 
skype, slack, snes9x, soundflower, sourcetree, spectacle, spotify, steam, 
sublime-text, texstudio, transmission, vagrant, virtualbox, vlc, whatsapp, 
xquartz

Atom Packages: MagicPython, atom-isort, autocomplete-go, autocomplete-python, 
autoupdate-packages, builder-go, column-select, cursor-indicator, event-watch, 
file-icons, force-tab, go-config, go-get, go-plus, gofmt, gometalinter-linter, 
gorename, highlight-selected, language-applescript, language-cmake, 
language-diff, language-docker, language-groovy, language-json, language-latex, 
language-restructuredtext, language-rust, line-length-break, linter, 
linter-clang, linter-coffeelint, linter-csslint, linter-docker, linter-erb, 
linter-flake8, linter-jsonlint, linter-just-say-no, linter-raml, 
linter-shellcheck, linter-tidy, linter-write-good, minimap, 
minimap-find-and-replace, minimap-git-diff, minimap-highlight-selected, 
minimap-selection, multi-wrap-guide, native-ui, navigator-godef, nvatom, 
pretty-json, python-yapf, raml, red-wavy-underline, script, set-syntax, 
soft-wrap-indicator, sort-lines, tab-control, tabs-to-spaces, tester-go, 
toggle-quotes, trailing-spaces

Pip Packages: httpie, inflection, isort, patch, python-json-logger, termcolor, 
yapf

Conda Packages: abstract-rendering, alabaster, anaconda, anaconda-client, 
anaconda-navigator, appnope, appscript, argcomplete, astropy, babel, 
beautifulsoup4, bitarray, blaze-core, bokeh, boto, bottleneck, cffi, chest, 
cloudpickle, clyent, colorama, conda, conda-build, conda-env, conda-manager, 
configobj, cryptography, curl, cycler, cython, cytoolz, dask, datashape, 
decorator, dill, docutils, dynd-python, et_xmlfile, fastcache, flake8, flask, 
flask-cors, freetype, futures, gevent, greenlet, h5py, hdf5, heapdict, idna, 
ipykernel, ipython, ipython-notebook, ipython-qtconsole, ipython_genutils, 
ipywidgets, itsdangerous, jbig, jdcal, jedi, jinja2, jpeg, jsonschema, jupyter, 
jupyter_client, jupyter_console, jupyter_core, launcher, libdynd, libpng, 
libtiff, libxml2, libxslt, llvmlite, locket, lxml, markupsafe, matplotlib, 
mccabe, mistune, mkl, mkl-service, mpmath, multipledispatch, nbconvert, 
nbformat, networkx, nltk, node-webkit, nose, notebook, numba, numexpr, numpy, 
odo, openpyxl, openssl, pandas, partd, path.py, patsy, pep8, pexpect, 
pickleshare, pillow, pip, ply, psutil, ptyprocess, py, pyasn1, pycosat, 
pycparser, pycrypto, pycurl, pyflakes, pygments, pymongo, pyopenssl, pyparsing, 
pyqt, pytables, pytest, python, python-dateutil, python.app, pytz, pyyaml, 
pyzmq, qt, qtawesome, qtconsole, qtpy, readline, redis, redis-py, requests, 
rope, ruamel_yaml, scikit-image, scikit-learn, scipy, setuptools, 
simplegeneric, singledispatch, sip, six, snowballstemmer, sockjs-tornado, 
sphinx, sphinx_rtd_theme, spyder, spyder-app, sqlalchemy, sqlite, statsmodels, 
sympy, terminado, tk, toolz, tornado, traitlets, unicodecsv, werkzeug, wheel, 
xlrd, xlsxwriter, xlwings, xlwt, xz, yaml, zeromq, zlib

Gem Packages: actionmailer, actionpack, actionview, activejob, activesupport, 
bigdecimal, blankslate, builder, bundler-unload, claide, cocoapods, 
cocoapods-core, cocoapods-deintegrate, cocoapods-downloader, cocoapods-plugins, 
cocoapods-search, cocoapods-stats, cocoapods-trunk, cocoapods-try, 
coffee-script, coffee-script-source, colorator, colored, commander, erubis, 
escape, execjs, executable-hooks, ffi, fourflusher, fuzzy_match, gem-wrappers, 
globalid, highline, i18n, io-console, jekyll, jekyll-sass-converter, 
jekyll-watch, json, kramdown, liquid, lolcat, loofah, mail, mercenary, 
mime-types, mime-types-data, mini_portile2, minitest, molinillo, nap, 
net-telnet, netrc, nokogiri, paint, parslet, power_assert, psych, puppet-lint, 
rack, rack-test, rails-deprecated_sanitizer, rails-dom-testing, 
rails-html-sanitizer, rake, rb-fsevent, rb-inotify, rdoc, rouge, ruby_dep, 
rubygems-bundler, rubygems-update, rvm, safe_yaml, sass, test-unit, 
thread_safe, toml, trollop, tzinfo, xcodeproj

Node Modules: JSON, coffee-script, coffeelint, cson, dockerlint, js-beautify, 
json-stable-stringify, moment, nesh, tmpin

# License

```
Inconsolata font Created by Raph Levien using his own tools and FontForge.
Copyright 2006 Raph Levien. Released under the SIL Open Font License.


The MIT License (MIT)

Copyright (c) 2016, lexicalunit@lexicalunit.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```


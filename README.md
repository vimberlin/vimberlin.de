[![Join the chat at https://gitter.im/vimberlin/vimberlin.de](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vimberlin/vimberlin.de?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository is mainly maintained by [@wikimatze](http://wikimatze.de/ "@wikimatze").

The site is manually deployed with SSH on a German hoster called [Webhostone](https://www.webhostone.de/de/).


# Installation

Install [Hugo](https://gohugo.io/ "Hugo") (at least version 43) for Ubuntu via


``
sudo apt-get install hugo
``

or for Mac via:


``
brew install hugo
``


To validate the installation please run the following command:


``
hugo help
``


If you see an output like:


``
~/git/vimberlin.de$ hugo help
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at http://gohugo.io/.
...
``

Then you can start working.

To install the latest package for ubuntu, you can see an instruction under
<https://hostadvice.com/how-to/how-to-install-hugo-on-ubuntu-18-04/>.


# Setup project

Clone this repo:

```
git clone git@github.com:vimberlin/vimberlin.de.git && cd vimberlin.de
```


Then clone the [hyde-hdye theme](https://themes.gohugo.io/hyde-hyde/) via:


```
git clone https://github.com/htr3n/hyde-hyde.git themes/hyde-hyde
```

Build the project:

``
hugo server
``


# Deployment

I'm using the env variable `HUGO_ENV` with the value `production` to deploy
it to the live environment with the following command:



```
export HUGO_ENV='production' && rake deploy && export HUGO_ENV='staging'
```


In order to run the command from above please install [Ruby](https://www.ruby-lang.org/en/ "Ruby") and [Rake](https://github.com/ruby/rake "Rake").


# Technologies

- [hugo](https://gohugo.io/ "hugo")
- [hyde-hdye theme](https://themes.gohugo.io/hyde-hyde/ "hyde-hyde theme")


# License

All files are MIT Licensed. Feel free to use the HTML and CSS as you please.

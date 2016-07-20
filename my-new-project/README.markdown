# Middleman Ethos

A  prototyping framework for [Middleman](http://middlemanapp.com/) in active development. Currently using Bootstrap 3 and jQuery, but this will likely change.

## Key Features

* Basic homepage template and navigation system
* Contact Us form template with thank you page
* Environment-based project configuration 
* SassDoc support
* Prototype transactional emails with `send_email()` helper and mailcatcher
* Built-in JavaScript form validation by adding the class `validate` to your form and adding the class `required` to each required field. Support for `type=email` is built-in thanks to the jQuery Validation Plugin

## Installation

This is a middleman template that can be installed in your middleman project templates directory. First install middleman as a Ruby gem.

`gem install middleman`

Then clone the repository into your templates folder.

`git clone git@github.com:timknight/middleman-ethos.git ~/.middleman/middleman-ethos`

Create a new project using Ethos

`middleman init [PROJECTNAME] -T middleman-ethos`

## Project Configuration

Project information is found in /data/config.yml. The YAML file supports multi-environment configuration by adding the values within keys for "development" and "build". A custom site helper is available called `project_setting` which takes the YAML key value as either a string or a symbol: `project_setting(:title)` or `project_setting("title")`.

## Page Configuration

Each page takes advantage of some basic frontmatter that's built into Middleman. Pages support the following frontmatter:

```
---
title:
nav:
subnav:
description:
---
```

* `title`: is prepended into the page title
* `nav`: used to determine the current page's primary navigation state
* `subnav`: used to determine the current page's secondary navigation state
* `description`: used to create a description meta tag for that page

## Mailcatcher Support and Email Prototyping

Support for [Mailcatcher](http://mailcatcher.me/) is built in for the development mode only. This allows for prototyping transactional emails. To get started, make sure to install the mailcatcher gem and that it is running.

`gem install mailcatcher`

* See `/contact/thankyou.html.erb` for an example of using the `send_email()` helper.
* `send_email([template], [subject: Subject Line (optional)], [to: to@email.com (optional)]`
* Host configuration, from, and to addresses are configured in the `/data/config.yml` file.
* Mailer templates should be located in `/mailers/` and do not support ERB.

## Pesticide Support

[Pesticide](http://pesticide.io/) has been built into the CSS. To turn on Pesticide debugging edit `/utilities/_variables.css` and change `$pesticide-debug` to true.

## SassDoc Support
Generate documentation with SassDoc using `sassdoc source/assets/stylesheets/ docs/`. Precompiled documentation can be found within the `docs` folder. Alternatively you can generate using `rake sassdoc`.

## Planned To-Do

Currently I'm using Bootstrap here, but my plan is to move further away from Bootstrap while creating more of a OOCSS model and using Neat or Susy for the grid system. Stay tuned for continued updates.
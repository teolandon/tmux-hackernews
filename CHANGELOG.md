# Changelog
All notable changes to this project will be documented in this file

## 0.1.0
### Added
 * FILE: hackernews.tmux - with basic functionality, replaces an instance of `#{headline}` in status-right, and replaces it with an execution call of news.sh 
 * FILE: news.sh - produces a different headline from the [Hackernews](https://news.ycombinator.com) frontpage, over the course of two hours -- that is, it changes headline every 4 minutes.
 * FILE: vars.conf - for now useless, but will contain some variables for customization of the headline field
 * FILE: .gitignore - to ignore .swp files
 * FILE: CHANGELOG.md - to keep a changelong
 * README.md Installation, Usage, Formatting, Credits and TODO sections

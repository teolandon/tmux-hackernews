# Changelog
All notable changes to this project will be documented in this file

## 0.3.1 - 2017-05-15 - HOTFIX
### Changed
 * Literally added a single character in `hackernews.tmux` to make the `C-h` keybind work properly.

## 0.3.0 - 2017-05-15
### Added
 * [FILE] urls.sh - reutrns the URL to the current story.
 * [FILE] compute_index.sh - moved code into here to make it more DRY and organized.
 * Keybind `<C-h>` to opening a new tmux window with the currect link on `w3m`.
 * Some comments in main script (hackernews.tmux).
### Changed
 * **Planned Features** section in README.md

## 0.2.0 - 2017-05-14
### Added
 * [FILE] inc.sh - script to increment the offset in vars.conf, so as to go to the next headline.
 * [FILE] dec.sh - script to decrement the offset in vars.conf, so as to go to the previous headline.
 * Keybinds to trigger the two scripts above, `Prefix + <` and `Prefix + >` respectively.
 * Dates on this change log.
 * **Keybinds** and **Planned Features** sections in README.
### Changed
 * Formatting for files in this change log.

## 0.1.0 - 2017-05-13
### Added
 * [FILE] hackernews.tmux - with basic functionality, replaces an instance of `#{headline}` in status-right, and replaces it with an execution call of news.sh 
 * [FILE] news.sh - produces a different headline from the [Hackernews](https://news.ycombinator.com) frontpage, over the course of two hours -- that is, it changes headline every 4 minutes.
 * [FILE] vars.conf - for now useless, but will contain some variables for customization of the headline field
 * [FILE] .gitignore - to ignore .swp files
 * [FILE] CHANGELOG.md - to keep a changelong
 * README.md Installation, Usage, Formatting, Credits and TODO sections

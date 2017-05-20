# Changelog
All notable changes to this project will be documented in this file

## 0.5.0 - 2017-05-20
### Added
 * [FILE] headlines.conf - stores a cache of all headlines and links for 2 hours. Not to be edited. File doesn't initially exist, but gets created.
### Changed
 * `news.sh` behavior. Now uses `headlines.conf` to show headlines for two hours after it's modified. Done to reduce HTTP requests and have a more consistent display.
 * `urls.sh` behavior. Now uses `headlines.conf` to pass URLs, so as to keep the URLs consistent with the headlines.
### Removed
 * `headline` variable from `vars.conf` file.

## 0.4.3 - 2017-05-17
### Changed
 * Changed default link hotkey to `Prefix + h` instead of `Prefix + C-h`, since C-h is a kinda iffy key with some terminals (seen as backspace). 

## 0.4.2 - 2017-05-16
### Changed
 * `news.sh` now doesn't make an HTTP request if not needed - Most tmux users have the statusbar refresh rate at 1 second, so as to have a nice clock, but making an HTTP request every second is just wrong. The current headline is now stored in `vars.conf`, and only if the index changes, does the script make an HTTP request.
 * Fixed variable lookup to prevent errors.

## 0.4.1 - 2017-05-15
### Added
 * Checks for the current browser. If it doesn't exist, the binding is not set

## 0.4.0 - 2017-05-15
### Added
 * New variables in `vars.conf` for customization of browser and headline width.
 * [FILE] browser.sh - returns the browser specified in `vars.conf`.

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

# tmux-hackernews
Allows display of periodically updating Hackernews headlines in tmux statusbar.

## Installation
### Tmux Plugin Manager
If you're using Tmux Plugin Manager (TPM), add this line to your `.tmux.conf` file in your plugin list:

    set -g @plugin 'teolandon/tmux-hackernews'

Then use `Prefix + I` to install it.

### Manual Installation
Clone this repository using git:

    git clone htpps://github.com/teolandon/tmux-hackernews ~/path/to/plugin

Of course, substituting `~/path/to/plugin` with whatever path you want to store this plugin in.

Then, add this line at the end of your `.tmux.conf`:

    run-shell ~/path/to/plugin/hackernews.tmux

Again, substitue the path with your desired path. Reload your `.tmux.conf` or restart the tmux server, and the plugin should be active. To reload your `.tmux.conf` use

    tmux source-file ~/.tmux.conf

or wherever your tmux config file is located at.

## Usage and formatting
### Usage
Include the format string `${headline}` somewhere in status-right, and they should render as the current headline. Example:

```
# This is in .tmux.conf
set -g status-right ' #{headline} | %d/$m | %H:%M:%S '
```

### Formatting
The headline format string should be substituted by a headline from [Hackernews](https://news.ycombinator.com), in orange background and black font. Headlines are cut off at 72 characters. Headlines to be shown are picked from the current top 30 stories in the frontpage, and cycle around in a period of 2 hours, meaning that the displayed headline increments every 4 minutes. Customization will be included in a future update.

Note that the headline cannot be styled, and styling persists after it, so you have to set foreground and background colors again after it. This behavior is going to be fixed in a future update.
 
For now, this plugin only works in status-right. Functionality in status-left is going to be implemented in a future update.

## Credits
This plugin is heavily inspired and modeled after [tmux-battery](https://github.com/tmux-plugins/tmux-battery).

## TODO
 * Acquire permission to model this file after the tmux-battery README.
 * Eliminate "...in a future update" mentions by including a **Planned features** section.
 * Keybinds for going to next or previous headline.
 * Currently, if the website changes the headline displayed, the script also displays the new headline, resulting in unexpected changes and sometimes duplicates. Implementation of a fix.
 * Keybind to open new window or split with current headline article on w3m or specified browser.
 * status-left support
 * Create new format strings for colors, so as to allow easy customization of formatting.

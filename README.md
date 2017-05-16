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
Include the format string `${headline}` somewhere in status-right or status-left, and they should render as the current headline. Example:

```
# This is in .tmux.conf
set -g status-right ' #{headline} | %d/$m | %H:%M:%S '
```

### Formatting
The headline format string should be substituted by a headline from [Hackernews](https://news.ycombinator.com). Headlines are cut off at a character limit specified in the file `vars.conf`, under the variable `max_chars`. Headlines to be shown are picked from the current top 30 stories in the frontpage, and cycle around in a period of 2 hours, meaning that the displayed headline increments every 4 minutes. Customization will be included in a future update.

## Keybinds
`Prefix + >` shows the next headline.

`Prefix + <` shows the previous headline.

`Prefix + C-h` opens up a new tmux window with the current article displayed using the browser program specified in `vars.conf`, under the variable `browser`.

## Planned Features
 * Currently, if the website changes the headline displayed, the script also displays the new headline, resulting in unexpected changes and sometimes duplicates. Implementation of a fix.

## Credits
This plugin is heavily inspired and modeled after [tmux-battery](https://github.com/tmux-plugins/tmux-battery).

## TODO
 * Acquire permission to model this file after the tmux-battery README.
 * Add **Customization** section in this README.

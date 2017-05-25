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

This will display the headline next to date and time, without any formatting.

### Formatting
The headline format string should be substituted by a headline from [Hackernews](https://news.ycombinator.com). Headlines are cut off at a character limit specified in the file `vars.conf`, under the variable `max_chars`. Headlines to be shown are picked from the current top 30 stories in the frontpage every 2 hours, and cycle around until new ones get pulled, meaning that the displayed headline increments every 4 minutes. Customization will be included in a future update.

## Customization
`tmux-hackernews` uses tmux user options as customization variables. Simply set them to what you want in your `.tmux.conf` file, as such:

    set -g @var-name 'var-value'

List of variables:
 * `@hackernews-browser` - Choose your browser by editing this variable. The plugin assumes that your browser takes a URL as a single argument and opens it up in a new tab. If your browser needs an option to open the tab in your liking, you should add the option, it will be considered. If you need options *after* the url, then leave an issue and I will look into implementing that. Defaults to xdg-open.
 * `@headline-max-chars` - Specify the maximum character width you desire the headline field to take. Any headlines longer than this character width will be truncated with three dots in the end. Fixed width and dynamic width options might be implemented in a future update. Defaults to 80.

## Keybinds
`Prefix + >` shows the next headline.

`Prefix + <` shows the previous headline.

`Prefix + h` opens up the link to the current headline on your system's browser.

## Planned Features
 * Switch from curl-ing the whole website to using the API. Will possibly allow for easy implementation of more than 30 headlines.
 * Pulling headlines from other news sites or at least pages of ycombinator.
 * Reload keybind?
 * Remove some keybinds? (I feel like they're too many).
 * Got any new ideas for features? Leave them as an Issue in the Issues page!

## Credits
This plugin is heavily inspired and modeled after [tmux-battery](https://github.com/tmux-plugins/tmux-battery).

## TODO
 * Use tmux variables instead of a file that contains the variables.
 * DRY out code, use a single script that loads all variables, and source it in every script that needs them.
 * Keep updating!

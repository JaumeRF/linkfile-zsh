# Link File Plugin

With this plugin you will be able to add shortcuts to your favourites directories 

## Installation 

You can install this plugin in two ways:

**<·> If you have [oh my zsh](https://ohmyz.sh/) (Recommended):**

- You have to clone this repository in the plugin directory
```zsh
~/.oh-my-zsh/plugins/

git clone https://github.com/JaumeRF/linkfile-zsh.git
````
- And then add linkfile to the plugins array in your .zshrc file:
```zsh
plugins=(... linkfile-zsh)
```


**<·> If you don\'t want to install oh my zsh:**

- First, you need to copy the raw code in github.
- After that, open your .zshrc file in a text editor and paste the raw code at the end.

**Note:** normally the .zshrc file is in the home directory: `~/` at the terminal.

**Note:** to reload the .zshrc file run `source ~/.zshrc`at the terminal.
## Functions

- `linkfile [shorcut-name] [path]`: add a shortcut
- `linkfile [shortcut-name]`: add a shortcut to the actual directory
- `linkfile`: add a shortcut, with the same name as the directory, to the actual directory 

- `linkfile_list`: lists all shortcuts

- `linkfile_rename [old-name] [new-name]`: rename an existing shortcut

- `linkfile_remove [shortcut-name]`: remove a shortcut

- `linkfile_delete`: remove all shortcuts

**Note:** With `linkfile_remove`and `linkfile_delete` you'll be asked if you want to remove shortcuts `1`accept `2`cancel:
```
Do you wish to delete the link: [shortcut-name] ?
1) Yes  2)No
?#
```
## Usage

First, generate a shortcut
```zsh
linkfile [shortcut-name] [path]
```
And then you can access to your folder with:
```zsh
ƒ [shortcut-name]
````
**Note:** the special character `ƒ` can be changed in `default var_prefix "ƒ"` in the .zsh file or in the raw code.

## Aliases 

| Alias     | Command           |
|:----------|:------------------|
| lf        | linkfile          |
| lfls      | linkfile_list     |
| lfrnm     | linkfile_rename   |
| lfrm      | linkfile_remove   |
| lfdlt     | linkfile_delete   |

## Author

- **[Jaume Ros](https://github.com/JaumeRF)**

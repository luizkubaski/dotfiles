# Trying to keep track of the dotfiles with stow

Basic usage: create a folder in `~/` with a name of your choice. Here I use `~/dotfiles`.  
After that you can copy the wanted dotfiles to this directory following the following schema:

Suppose you want to add the dotfiles for the application `the_app` located at `~/.config/the_app/the_app.conf`. First, you create a folder named `the_app` inside the `~/dotfiles` folder. Now the path `~/dotfiles/the_app` exists. From here you pretend to be in the `~/` directory. So to access the dotfiles you would need to first access `.config/`, then `the_app/`, and finally `the_app.conf`. You have to do the same with the dotfiles folder, so you will have a path `~/dotfiles/the_app/.config/the_app/the_app.conf`.

If the files is located at `~/` like X files usually are, just create a path `~/dotfiles/x/.Xresources` for example.

And that's it. Now if you want to use some of these files just go to the `dotfiles` folder

```bash
cd ~/dotfiles
```

then choose the app you want the dot files and enter `stow <app_name>`

```bash
stow the_app
```

and this will automatically create symlinks for the dotfiles.

Hint: if you have different environments you can create branches on github for each environment.

What if one day stow just doesn't exist anymore? Well, at the end of the day all that stow does is create symlinks for the dofiles.

TODO:

<s>- nbfc-linux </s>

- nvidia-drivers
- pipewire
- audio troubleshooting
- explain some utilities? (pywall, polybar)
- add references.

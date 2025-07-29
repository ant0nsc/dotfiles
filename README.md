# Anton's dotfiles

Set up on a new machine:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ant0nsc
```

Alternative: Install mise via

```shell
curl https://mise.run | sh
```

then run

```shell
mise use --global chezmoi
```

Then run `chezmoi init --apply ant0nsc` to set up the dotfiles.

## Chezmoi Cheat Sheet

Documentation: [https://chezmoi.io/docs/](https://chezmoi.io/docs/)

- Chezmoi state is stored in a Git repository at `~/.local/share/chezmoi`. You can do `git` commands directly in that folder, or use the `chezmoi` commands below.
- Add a new file (or a changed file) to chezmoi: ```chezmoi add <file>```
  - Example: you have modified `~/.gitconfig` and want to add the changes to chezmoi, run `chezmoi add ~/.gitconfig`
- Remove a file from chezmoi: ```chezmoi remove <file>```
- Show the status of files managed by chezmoi: ```chezmoi status```
  - Similar to `git status`, it shows the names of the files that have been modified, but not yet committed it to chezmoi
- Show all the differences between the current state and the state managed by chezmoi: ```chezmoi diff```
  - For example, it shows which changes you have made to `~/.bashrc` locally, but not yet committed it to chezmoi
- Edit a file managed by chezmoi: ```chezmoi edit <file>```
  - this will open the file in your default editor `$EDITOR`
- Pull the latest changes from the remote repository and apply: ```chezmoi update```
  - You can add a `--dry-run` flag to see what would happen without actually applying the changes

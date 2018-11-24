# Using files here
> TODO write a script that does this
### All
include this directory in path

### .aliases
1. in ~/.bashrc insert this line: `. ~/.aliases` 

# Linux How To

| description | command | source|
|--|--|--|
| reload after adding alias |`source ~/.bashrc` | [hostingadvice.com](https://www.hostingadvice.com/how-to/set-command-aliases-linuxubuntudebian/) 
| run same command again with sudo | `sudo !!`  | [askubuntu.com](https://askubuntu.com/questions/300832/run-same-command-again-but-as-root)

## some useful stuff

[about last commands](https://www.ostechnix.com/5-ways-repeat-last-command-linux/)
- `!-2` will repeat second to last
- `!un` will execute last command that starts with the letters “un”

## don't know how to name this section yet
### importing alias file
[stackexchange](https://superuser.com/questions/331763/bashrc-loading-aliases-from-different-file)

## Folder management
- alias to add current directory

# TODO
- [ ] do export environment variables and path similar to aliases 
- [ ] ? group aliases in files? under directory, and get all files in that directory in .aliases (so it's automatically updated)

## git
[some info](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
- [ ] add branch name to all commits [like this](https://stackoverflow.com/questions/5894946/how-to-add-gits-branch-name-to-the-commit-message)
- [ ] configure commits to get message from file (and add hook to empty it, add alias to echo > to it) in commit message, if there are multiple lines, display and ask for summary (or line number to display), convert all others to `-` [here's how](https://stackoverflow.com/questions/20438293/preparing-a-git-commit-messaging-before-committing)
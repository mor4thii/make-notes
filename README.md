# make-notes
Simple note making app that aims to be unobtrusive and generally available to your workflow

## Configuration

It is possible to pull the app and configure an out-of-source data folder.
This is useful if separating the app's logic and the data tracked by it is needed.

Simply provide a fully qualified path with or without trailing '/' in the very first line of `config/data-folder`

```bash
cp config/data-folder.template config/data-folder
```


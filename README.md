# Github Pages Deploy

Easily deploy a `master` build directory to the `gh-pages` branch.

## Requirements
- A git submodule setup on your `master` branch, pointing to your `gh-pages` branch.<br>
- Have a directory _(i.e: build)_ containing the generated built code based on `master` branch source.


## Usage

`gh-deploy <source-directory> <target-directory>`


### Example:

Having the following structure:

```
.
├── package.json
└── build
│   ├── index.html
│   ├── main-d3dskj39.css
│   └── main-d39j45.js
├── gh-pages
│   ├── CNAME
│   ├── circle.yml
│   └── README.md
├── src
    └── …
```

After running the `gh-deploy build/ gh-pages/` the script should do its job, copy all required files to `gh-pages` directory and push the code go `gh-pages` branch. All pushes will always be incremental and do not force conflicts.

The commit message points to the change made on the master branch for convenience.

### Works great for CI

#### package.json
```js
{
    "name": "my-app",
    "dependencies": {
        "pakku": "^1.0.0",
        "gh-deploy": "zanona/gh-deploy"
    },
    "scripts": {
        "build": "pakku src/ build/",
        "deploy": "gh-deploy build/ gh-pages/"
    }
}
```

Enjoy! ;)

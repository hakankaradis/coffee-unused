# coffee-unused

This module helps you identify unused variables in your coffescript project.
It finds all unused variables under a given directory and returns an array of objects
specifying the name of the variable, its path and line number.

```js
  [[
    {
      name: 'fs'
      path: 'directory_path/vars/var1.coffee:1'
      lineNumber: 1
    }
    {
      name: 'options'
      path: 'directory_path/vars/var1.coffee:3'
      lineNumber: 3
    }
  ]]
```

## Install

```sh
npm install coffee-unused
```

## Usage

```sh
node ./node_modules/coffee-unused/index.js --src <path to walk>  [-s|--skip-parse-error]
```


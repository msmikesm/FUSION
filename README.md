<div align="center">
	<div>
		<img width="300" src="media/fusion.svg" alt="Fusion">
	</div>
	<br>
    <h1>FUSION<h1>
    <em>For people tired of frameworks.</em>
</div>

## About
**Fusion** is a ready-made development environment based on: Typescript, SASS etc. It automates the process of creating a project tree and basic settings. It allows you to write complete applications from front-end to backend.
The construction process is supervised by Webpack and Babel.


The script can be added to the **environment variable** and run with a single command.

## Prerequisites
You just need to have the [NodeJS](https://nodejs.org/en/) installed.

## Getting Started
> The script is designed for **Linux** and **Mac** users.

First we have to grant permission to the script.<br>
In the directory where we downloaded the script:
```
$ chmod +x fusion.sh
```

Then we can run it:
```
$ ./fusion.sh
```

Or we can add the script to the environment variable.<br>
Follow these steps:
```
$ sudo mv fusion.sh /usr/local/bin
$ sudo touch /.bash_aliases
$ sudo sh -c "echo \"alias fusion='/usr/local/bin/fusion.sh'\" > /.bash_aliases"
$ source /.bash_aliases
```

And just type:
```
$ fusion
```

## Installing
After running the script we will be asked for the name of the project (required), description (not required), and author (not required).<br>
The rest of the process is automated.

## Start working
When the script is finished, we will get information about the commands we need.<br>
In order to start work, we move on to the newly created project.
```
$ cd projectname
```
Then, to start working:
```
$ npm run start
```

to build a project:
```
$ npm run build
```

to run a server written by us:
```
$ npm run start:server
```

to rebuild only our server:
```
$ npm run build:server
```

## Initial project structure

    projectname |
                +--| dist
                |  +--| client
                |  |  +--| css
                |  |  | + style.css
                |  |  |
                |  |  +--| img
                |  |  +--| js
                |  |
                |  +--| templates
                |
                +--| server
                |  +--| config
                |  |  + config.ts
                |  |
                |  + server.ts
                |
                +--| src
                |  +--| sass
                |  |   +--| abstracs
                |  |   |  + _vriables.scss
                |  |   |
                |  |   +--| base
                |  |   |  + _base.scss
                |  |   |  + _typography.scss
                |  |   |
                |  |   +--| components
                |  |   +--| layout
                |  |   |  + _container.scss
                |  |   |
                |  |   +--| pages
                |  |   +--| themes
                |  |   +--| vendors
                |  |   + main.scss
                |  |
                |  +--| ts
                |  |  +--| model
                |  |  |  + Welcome.ts
                |  |  |
                |  |  +--| view
                |  |  |  + animations.ts
                |  |  |  + message.ts
                |  |  |
                |  |  + index.ts
                |  |
                |  + index.html
                |
                + package.json
                + package-lock.json
                + webpack.config.js
                + webpack.dev.js
                + tsconfig.json
                + tsconfig.srv.json
                + .babelrc
                + .gitignore
                + README.md

## Author
- [Michal Siemienowicz](linkedin.com/in/michal-siemienowicz-761879151)


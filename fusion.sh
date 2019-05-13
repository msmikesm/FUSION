#!/bin/bash

# COLORS
NC='\033[0m' # no color
LGREEN='\033[1;32m'
LCYAN='\033[1;36m'
LBLUE='\033[1;34m'
LPURPLE='\033[1;35m'
YELLOW='\033[1;33m'
LRED='\033[1;31m'

# WELCOME AND READ
echo -e "${LCYAN}Hello, enter your project name (lowercase):${YELLOW}"
read projectName
if [ "$projectName" = "" ]
then
    echo -e "${LRED}You must enter the name of the project!"
    exit 1
fi

echo -e "${LCYAN}Enter a author of the project:${YELLOW}"
read description
if [ "$description" = "" ]
then
    description="New project"
fi

echo -e "${LCYAN}Enter a description of the project:${YELLOW}"
read author
if [ "$author" = "" ]
then
    author="Anonymous"
fi

echo -e "${LBLUE}Create a project structure: ${LGREEN}$projectName${NC}"

# FOLDER NAME ARRAYS --------------------------------------------------------------------------------------------

# main folders
mainFolders=("dist" "server" "src")
main_lenght=${#mainFolders[@]}

# dist folders
distFolders=("client" "templates")
dist_lenght=${#distFolders[@]}

# dist/client folders
clientFolders=("css" "img" "js")
client_lenght=${#clientFolders[@]}

# server folders
serverFolders=("config")
server_lenght=${#serverFolders[@]}

# src folders
srcFolders=("sass" "ts")
src_lenght=${#srcFolders[@]}

# src/sass folders
sassFolders=("abstracs" "base" "components" "layout" "pages" "themes" "vendors")
sass_lenght=${#sassFolders[@]}

# src/ts
tsFolders=("model" "view")
ts_lenght=${#tsFolders[@]}


# FILE NAME ARRAYS -----------------------------------------------------------------------------------------------

# main files
mainFiles=(".babelrc" ".gitignore" "package.json" "README.md" "tsconfig.json" "tsconfig.srv.json" "webpack.config.js" "webpack.dev.js")
main_files_lenght=${#mainFiles[@]}

# FILES TEXT ----------------------------------------------------------------------------------------------
# main files content
mainText=(
    "{
        \"presets\": [
        [\"@babel/preset-env\", {
            \"targets\": {
            \"browsers\": [
                \"last 5 versions\",
                \"safari >= 7\",
                \"ie >= 8\"
                ]
            }
        }]
        ]
    }" 
    "node_modules
npm-debug.log
.DS_Store
/*.env" 
    "{
    \"name\": \"${projectName}\",
    \"version\": \"1.0.0\",
    \"description\": \"${description}\",
    \"main\": \"dist/js/index.js\",
    \"scripts\": {
        \"server:ts\": \"webpack-dev-server --config webpack.dev.js\",
        \"watch:css\": \"node-sass src/sass/main.scss dist/client/css/style.css -w\",
        \"dev:ts\": \"webpack --config webpack.dev.js\",
        \"server:prod\": \"webpack-dev-server --config webpack.config.js\",
        \"build:prod\": \"webpack --mode production --config webpack.config.js\",

        \"compile:css\": \"node-sass src/sass/main.scss dist/client/css/style.comp.css\",
        \"prefix:css\": \"postcss --use autoprefixer -b 'last 5 version' dist/client/css/style.comp.css -o dist/client/css/style.prefix.css\",
        \"compress:css\": \"node-sass dist/client/css/style.prefix.css dist/client/css/style.min.css --output-style compressed\",

        \"start:server\": \"node dist/server.js\",
        \"build:server\": \"tsc -p tsconfig.srv.json\",

        \"start\": \"npm-run-all --parallel server:ts watch:css\",
        \"build\": \"npm-run-all compile:css prefix:css compress:css dev:ts build:prod build:server\"
    },
    \"keywords\": [
        \"TS\",
        \"SASS\",
        \"Webpack\",
        \"Babel\"
    ],
    \"author\": \"${author}\",
    \"license\": \"ISC\",
    \"dependencies\": {
        \"@babel/polyfill\": \"^7.4.4\"
    },
    \"devDependencies\": {
        \"@babel/cli\": \"^7.4.4\",
        \"@babel/core\": \"^7.4.4\",
        \"@babel/preset-env\": \"^7.4.4\",
        \"autoprefixer\": \"^9.5.1\",
        \"babel-loader\": \"^8.0.5\",
        \"html-webpack-plugin\": \"^3.2.0\",
        \"node-sass\": \"^4.12.0\",
        \"npm-run-all\": \"^4.1.5\",
        \"postcss-cli\": \"^6.1.2\",
        \"ts-loader\": \"^5.4.4\",
        \"typescript\": \"^3.4.5\",
        \"webpack\": \"^4.30.0\",
        \"webpack-cli\": \"^3.3.1\",
        \"webpack-dev-server\": \"^3.3.1\"
    }
}" 
    "## ${projectName}
${description}
### Installation

### Run
### Author: ${author}" 
    "{
    \"compilerOptions\": {
        \"noImplicitAny\": false,
        \"module\": \"es6\",
        \"target\": \"es6\",
        \"allowJs\": true,
    },
    \"exclude\": [
        \"server\"
    ]
}" 
    "{
    \"compilerOptions\": {
        \"noImplicitAny\": false,
        \"module\": \"commonjs\",
        \"target\": \"es5\",
        \"allowJs\": true,
        \"removeComments\": true,
        \"outDir\": \"dist\"
    },
    \"include\": [
        \"server/**/*\"
    ],
    \"exclude\": [
        \"src\",
        \"node_modules\"
    ]
}" 
    "const path = require('path');
const htmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: ['@babel/polyfill', './dist/client/js/js/index.js'],
    output: {
        path: path.resolve(__dirname, 'dist/client/js'),
        filename: 'js/bundle.js'
    },
    mode: \"production\'\",
    devServer: {
        inline: true,
        contentBase: './dist/client',
        // https: true,
        host: '0.0.0.0',
        port: 8080,
        open: true,
        // hot: true,
        // useLocalIp: true,
        // bonjour: true,
        disableHostCheck: true,
        // watchOptions: {
        //     poll: true
        // }
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                include: path.resolve(__dirname, 'dist/client/js'),
                exclude: /node_modules/,
                loader: 'babel-loader'
            }
        ]
    },
    plugins: [
        new htmlWebpackPlugin({
            filename: 'index.html',
            template: './src/index.html'
        })
    ]
};" 
    "const path = require('path');
const htmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry:\"./src/ts/index.ts\",
    output: {
        path: path.resolve(__dirname, 'dist/client/js'),
        filename: \"js/index.js\"
    },
    mode: \"development\",
    devServer: {
        inline: true,
        contentBase: './dist/client',
        watchContentBase: true,
        // https: true,
        // host: '0.0.0.0',
        port: 8080,
        open: true,
        // useLocalIp: true,
        // bonjour: true,
        // disableHostCheck: true,
        watchOptions: {
            poll: true,
            ignored: /node_modules/
        }
    },
    module:{
        rules: [
            {
                test:/\.ts?$/,
                include: path.resolve(__dirname, 'src/ts'),
                exclude: /node_modules/,
                use: {
                    loader:\"ts-loader\"
                }
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js']
    },
    plugins: [
        new htmlWebpackPlugin({
            filename: 'index.html',
            template: './src/index.html'
        })
    ]
};"
)

# sass txt files content
textInfo=("Code that doesn't output CSS (eg. variables, mixins, functions)"
 "Basic product definitions. (eg. html initial settings etc.)" 
 "Component styles (eg. nav, boxes etc)" 
 "Project layout (eg. header, main, footer etc.)" 
 "Styles for specific pages (eg. home, about, contact etc.)" 
 "Diffrent visual themes (eg. night mode)" 
 "Third part css
(eg. bootstrap)
To add, you need to install concat.
    npm install --save-dev concat
Replace following in package.json:

    \"compile:css\": \"node-sass src/sass/main.scss dist/css/style.comp.css\",
    \"concat:css\": \"concat -o dist/css/style.concat.css \n
                src/sass/vendors/<vendorCssFiles.css>
                dist/css/style.comp.css\",
    \"prefix:css\": \"postcss --use autoprefixer -b 'last 5 version' dist/css/style.concat.css -o dist/css/style.prefix.css\",
    \"compress:css\": \"node-sass dist/css/style.prefix.css dist/css/style.min.css --output-style compressed\","
)

# HTML
indexHTML="<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">
    <meta name=\"author\" content=\"${author}\">
    <link rel=\"stylesheet\" href=\"css/style.css\">
    <link href=\"https://fonts.googleapis.com/css?family=Indie+Flower\" rel=\"stylesheet\">
    <title>${projectName}</title>
</head>
<body>
    <div class=\"container\" id=\"con\"></div>
</body>
</html>"

# CSS
styleCSS=".container {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  justify-items: center;
  justify-content: center;
  width: 100%;
  min-height: 100vh;
  background-image: linear-gradient(to right bottom, #0f0c29, #302b63, #24243e);
  color: white; }

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: inherit; }

html {
  box-sizing: border-box;
  font-size: 62.5%; }

body {
  font-family: \"Indie Flower\", cursive;
  font-weight: 400;
  word-spacing: .2rem;
  letter-spacing: .1rem;
  line-height: 1.6;
  scroll-behavior: smooth; }

::selection {
  background-color: #540CE8;
  color: #fff; }

.heading {
  hyphens: none;
  letter-spacing: 3px; }
  .heading__first {
    font-size: 5rem; }
"

# SASS
variablesSCSS="\$color-purple-light: #CFD5FF;
\$color-primary: #540CE8;
\$color-primary-light: rgb(117, 47, 255);
\$font-primary: 'Indie Flower', cursive;"

baseSCSS="*,
*::before,
*::after {
    margin: 0;
    padding: 0;
    box-sizing: inherit;
}

html {
    box-sizing: border-box;
    font-size: 62.5%;
}

body {
    font-family: \$font-primary;
    font-weight: 400;
    word-spacing: .2rem;
    letter-spacing: .1rem;
    line-height: 1.6;
    scroll-behavior: smooth;
}

::selection {
    background-color: \$color-primary;
    color: #fff;
}"

typographySCSS=".heading {
    hyphens: none;
    letter-spacing: 3px;

    &__first {
        font-size: 5rem;
    }

}"

containerSCSS=".container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-items: center;
    justify-content: center;
    text-align: center;

    width: 100%;
    min-height: 100vh;

    background-image: linear-gradient(to right bottom, #0f0c29, #302b63, #24243e);
    color: white;
}"

mainSCSS="@import 'layout/container';
@import 'abstracs/variables';
@import 'base/base';
@import 'base/typography';"

# TS
indexTS="import { Welcome } from \"./model/Welcome\";

const welcome = new Welcome();
welcome.show();"

welcomeTS="import { animLetters } from \"../view/animations\";
import { message } from \"../view/message\";


interface stateProp {
    text: string,
    count: number
}

export class Welcome {

    public state: stateProp = {
        text: '',
        count: 0
    };

    public show() {
        let contents = [
            'Forget the limits',
            'FUSION'
        ];
        message('mess', contents[1], 'con');
        animLetters('mess', 3000);
        setInterval(() => {
            this.state.text = contents[this.state.count];
            this.state.count += 1;
            if (this.state.count == 2) {
                this.state.count = 0;
            }

            this.clear('con');
            message('mess', this.state.text, 'con');
            animLetters('mess', 3000);
        }, 6000);
    };

    private clear(id: string) {
        document.getElementById(id).innerHTML = '';
    };

};
"
GLOBIGNORE="*"
animationsTS="const colors = [
    'rgb(100, 214, 0)',
    'rgb(255, 251, 0)',
    'rgb(255, 38, 0)',
    'rgb(0, 119, 255)'
];

export const animLetters = (
    id: string,
    duration: number,
    direction: any = \"normal\",
    easing: string = \"ease\"
    ) => {
    let ran = Math.floor(Math.random() * Math.floor(4));
    let steps = new KeyframeEffect(
        document.getElementById(id), [
        {
            color: '#fff',
            opacity: 0
        },
        {color: colors[ran]},
        {
            color: '#fff',
            opacity: 1
        },
    ], {
        duration: duration,
        direction: direction,
        easing: easing
    });
    let anim = new Animation(steps, document.timeline);
    anim.play();
}"

messageTS="export const message = (id: string ,text: string, place: string) => {
    let markup = \`<h1 id=\"\${id}\" class=\"heading heading__first\">\${text}</h1>\`;
    document.getElementById(place).insertAdjacentHTML('beforeend', markup);
}"

# SERVER
configTS="interface conf {
    hostname: string,
    port: any
}

export const serverConf: conf = {
    hostname: '127.0.0.1',
    port: process.env.PORT || 3000
};"


serverTS="import {serverConf} from './config/config';
import * as http from 'http';
import * as url from 'url';
import * as fs from 'fs';


const server = http.createServer((req, res) => {

    const pathName = url.parse(req.url, true).pathname;
    if(pathName === '/') {
        res.writeHead(200, {'Content-type': 'text/html'});
        fs.readFile(\`\${__dirname}/client/js/index.html\`,'utf-8', (err, data) => {
            if (err) throw err;
            let output = data;
            res.end(output);
        });
    } else if ((/\.js$/i).test(pathName)) {
        res.writeHead(200, { 'Content-type': 'text/javascript' });
        fs.readFile(\`\${__dirname}/client/js\${pathName}\`, (err, data) => {
            if (err) throw err;
            res.end(data);
        });
    } else if ((/\.css$/i).test(pathName)) {
        res.writeHead(200, { 'Content-type': 'text/css' });
        fs.readFile(\`\${__dirname}/client\${pathName}\`, (err, data) => {
            if (err) throw err;
            res.end(data);
        });
    } else {
        res.writeHead(200, {'Content-type': 'text/html'});
        fs.readFile(\`\${__dirname}/client/js/index.html\`,'utf-8', (err, data) => {
            if (err) throw err;
            let output = data;
            res.end(output);
        });
    }
});

server.listen(serverConf.port, serverConf.hostname, () => {
    console.log(`Listening \for request now. -> \${serverConf.hostname}:\${serverConf.port}`);

    let address :string = \`http://\${serverConf.hostname}:\${serverConf.port}\`;
    let startBrowser :string = (process.platform == 'darwin' ? 'open':
                    process.platform == 'win32' ? 'start': 'xdg-open');
    require('child_process').exec(\`\${startBrowser} \${address}\`);
});"

# CREATE FOLDERS -----------------------------------------------------------------------------------------------------

# project folder
mkdir $projectName

# main folders
for i in `seq 0 $[main_lenght-1]`
do
    mkdir $projectName/${mainFolders[$i]}
    echo "$projectName/${mainFolders[$i]}"
done

# dist folders
for i in `seq 0 $[dist_lenght-1]`
do
    mkdir $projectName/dist/${distFolders[$i]}
    echo "$projectName/dist/${distFolders[$i]}"
done
# dist/client folders
for i in `seq 0 $[client_lenght-1]`
do
    mkdir $projectName/dist/client/${clientFolders[$i]}
    echo "$projectName/dist/client/${clientFolders[$i]}"
done

# server folders
for i in `seq 0 $[server_lenght-1]`
do
    mkdir $projectName/server/${serverFolders[$i]}
    echo "$projectName/server/${serverFolders[$i]}"
done

# src folders
for i in `seq 0 $[src_lenght-1]`
do
    mkdir $projectName/src/${srcFolders[$i]}
    echo "$projectName/src/${srcFolders[$i]}"
done
# src/sass folders
for i in `seq 0 $[sass_lenght-1]`
do
    mkdir $projectName/src/sass/${sassFolders[$i]}
    echo "$projectName/src/sass/${sassFolders[$i]}"
done
# src/ts folders
for i in `seq 0 $[ts_lenght-1]`
do
    mkdir $projectName/src/ts/${tsFolders[$i]}
    echo "$projectName/src/ts/${tsFolders[$i]}"
done

# CREATE FILES -------------------------------------------------------------------------------------------------------

# main files
for i in `seq 0 $[main_files_lenght-1]`
do
    touch $projectName/${mainFiles[$i]}
    echo "$projectName/${mainFiles[$i]}"
done

# dist/client/css file
touch $projectName/dist/client/css/style.css
echo "$projectName/dist/client/css/style.css"

# server files
touch $projectName/server/server.ts
touch $projectName/server/config/config.ts
echo "$projectName/server/server.ts"
echo "$projectName/server/config/config.ts"

# src files
touch $projectName/src/index.html
echo "$projectName/src/index.html"

touch $projectName/src/sass/main.scss
echo "$projectName/src/sass/main.scss"
touch $projectName/src/sass/abstracs/_variables.scss
echo "$projectName/src/sass/abstracs/_variables.scss"
touch $projectName/src/sass/base/_base.scss
echo "$projectName/src/sass/base/_base.scss"
touch $projectName/src/sass/base/_typography.scss
echo "$projectName/src/sass/base/_typography.scss"
touch $projectName/src/sass/layout/_container.scss
echo "$projectName/src/sass/layout/_container.scss"

for i in `seq 0 $[sass_lenght-1]`
do
    touch $projectName/src/sass/${sassFolders[$i]}/info.txt
    echo "$projectName/src/sass/${sassFolders[$i]}/info.txt"
done

touch $projectName/src/ts/index.ts
touch $projectName/src/ts/model/Welcome.ts
touch $projectName/src/ts/view/animations.ts
touch $projectName/src/ts/view/message.ts

echo "$projectName/src/ts/index.ts"
echo "$projectName/src/ts/model/Welcome.ts"
echo "$projectName/src/ts/view/animations.ts"
echo "$projectName/src/ts/view/message.ts"


# ADDING FILE CONTENT --------------------------------------------------------------------------------------------------
# add content to main files
for i in `seq 0 $[main_files_lenght-1]`
do
    echo "${mainText[$i]}" > $projectName/${mainFiles[$i]}
done

# add content to info.txt in sass
for i in `seq 0 $[sass_lenght-1]`
do
    echo "${textInfo[$i]}" > $projectName/src/sass/${sassFolders[$i]}/info.txt
done

# add content to html file
echo $indexHTML > $projectName/src/index.html

# add content to css file
echo $styleCSS > $projectName/dist/client/css/style.css

# add content to scss files
echo $variablesSCSS > $projectName/src/sass/abstracs/_variables.scss
echo $baseSCSS > $projectName/src/sass/base/_base.scss
echo $typographySCSS > $projectName/src/sass/base/_typography.scss
echo $containerSCSS > $projectName/src/sass/layout/_container.scss
echo $mainSCSS > $projectName/src/sass/_main.scss

# add content to ts files
echo $indexTS > $projectName/src/ts/index.ts
echo $welcomeTS > $projectName/src/ts/model/Welcome.ts
echo $animationsTS > $projectName/src/ts/view/animations.ts
echo $messageTS > $projectName/src/ts/view/message.ts

echo $serverTS > $projectName/server/server.ts
echo $configTS > $projectName/server/config/config.ts


# //! run installation
echo -e "\n ${LCYAN}Wait for installation end...${NC}\n"
cd $projectName/ && npm install

# END MESSAGE
echo -e "\n ${LGREEN}Done! Enjoy the coding :)${NC}\n"
echo -ne "\a"

echo -e "${LBLUE}Go to folder: ${YELLOW} \"cd ${projectName}/\"
${LBLUE}Start working: ${YELLOW} \"npm run start\"
${LBLUE}Build app (or build starter app): ${YELLOW} \"npm run build\"
${LBLUE}Start own server (after build): ${YELLOW} \"npm run start:server\"
${LBLUE}Rebuild only server: ${YELLOW} \"npm run build:server\" \n"
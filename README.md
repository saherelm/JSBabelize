SaherElm IT Center Babelize Tool
=================================

Help
-------

usage syntax :

        Babelize inputFile [outputFile] [-h]

Note
-----

before using this tool you have to
install 'babel-cli' and 'babel-preset-env'.

How To
---------

        - Create a Folder for Your Project and Go Inside.
        - Create your Modern Javascript Files.
        - run 'npm init' for creating a 'package.json' file.
        - run 'npm install --save-dev babel-cli' command to install 'babel-cli' package.
        - run 'npm install babel-preset-env --save-dev' command to install 'env' preset package.
        - now you can easily compile your modern javascript files using following syntax :

                > npx babel [your_modern_javascript_file.js] [--out-file [the_compiled_file.js]] [--presets=env]

        for example:
        ------------

        > npx babel BaseWidget.js --out-file BaseWidget.Babel.js --presets=env

        descrition:
        -----------
        above example going to find BaseWidget.js file and compile it into old js structure and put final
        code in BaseWidget.Babel.js file in current folder.

Reference
----------

https://babeljs.io/

Contact Info
-----------

Author: Hadi Khazaee Asl
Email: Hadi_Khazaee_asl@yahoo.com

Donate
-------

    - Bitcoin: 1Nfm5ZYXXfUZk4pzDN7KzZBFnuxDNUMvKo
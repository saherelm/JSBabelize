@rem SaherElm IT Center Babelize Tool 
@rem --------------------------------
@rem this tools help to increase the speed of
@rem Compiling Modern Javascript Codes using 
@rem Babel tool.
@rem
@rem Note: before using this tool you have to 
@rem install babel-cli and babel-preset-env.
 
@ECHO off

@rem Check if user don't enter atleast one Arg
IF [%1]==[] GOTO noArg

@rem Defining Global Vars ...
SET inputFile=%1
SET outputFile=%2

@rem counting input args :
SET argCount=0
FOR %%i in (%*) do (
	SET /A argCount+=1	
 	)


@rem Validating Args Max Count ...
IF %argCount% GTR 2 GOTO invalidArgs

@rem Handle help arg ...
IF %argCount% EQU 1 (	
		@rem Handle Help Commands ...
		IF "%1" == "-h" GOTO showHelp
		IF "%1" == "--h" GOTO showHelp
		IF "%1" == "/h" GOTO showHelp

		@rem Handle Generate Output File Name ...
		GOTO generateOutputFile
	)

@rem Handling two arg state ...
IF %argCount% EQU 2 (
		@rem Handle Help Exists Error ...
		IF "%1" == "-h" GOTO invalidArgs
		IF "%1" == "--h" GOTO invalidArgs
		IF "%1" == "/h" GOTO invalidArgs
		IF "%2" == "-h" GOTO invalidArgs
		IF "%2" == "--h" GOTO invalidArgs
		IF "%2" == "/h" GOTO invalidArgs

		IF %inputFile% == %outputFile% GOTO sameFileError

		@rem Handle Work with Input and Output Files ...
		GOTO startApp
	)

GOTO invalidArgs




@rem Generating Default Name for Output if not Exists ...
:generateOutputFile
SET inputFileWithoutExt=%~n1
SET inputFileExt=%~x1
SET outputFile=%inputFileWithoutExt%.Babel%inputFileExt%
GOTO startApp




@rem start Application Logic ...
:startApp
ECHO.
ECHO SaherElm IT Center Babelize Tool 
ECHO --------------------------------
ECHO.
ECHO Validating input file: %inputFile% ...

IF EXIST %inputFile% (

		ECHO Validating output file: %outputFile% ...

		IF EXIST %outputFile% GOTO deleteOutputFile

		GOTO startBabelizing

	) ELSE (

		GOTO inputFileNotFound

	)
GOTO showHelpAndEndError






@rem a Handler which calls when user don't add any args ...
:noArg
ECHO.
ECHO SaherElm IT Center Babelize Tool 
ECHO --------------------------------
ECHO this tools help to increase the speed of
ECHO Compiling Modern Javascript Codes using 
ECHO Babel tool. 
ECHO. 
ECHO.Note: before using this tool you have to 
ECHO install 'babel-cli' and 'babel-preset-env'. 
GOTO showHelpAndEndFinish


@rem show Help of Usage ...
:showHelp
ECHO.
ECHO SaherElm IT Center Babelize Tool 
ECHO --------------------------------
ECHO.
ECHO Help :
ECHO ======
ECHO.
ECHO usage syntax :
ECHO.
ECHO 	Babelize inputFile [outputFile] [-h]
ECHO. 
ECHO Note: 
ECHO -----
ECHO before using this tool you have to 
ECHO install 'babel-cli' and 'babel-preset-env'. 
ECHO.
ECHO How To :
ECHO ========
ECHO.
ECHO 	- Create a Folder for Your Project and Go Inside.
ECHO 	- Create your Modern Javascript Files.
ECHO 	- run 'npm init' for creating a 'package.json' file.
ECHO 	- run 'npm install --save-dev babel-cli' command to install 'babel-cli' package.
ECHO 	- run 'npm install babel-preset-env --save-dev' command to install 'env' preset package.
ECHO 	- now you can easily compile your modern javascript files using following syntax :
ECHO.	
ECHO 		^> npx babel [your_modern_javascript_file.js] [--out-file [the_compiled_file.js]] [--presets=env]
ECHO.
ECHO 	for example:
ECHO 	------------
ECHO.
ECHO 	^> npx babel BaseWidget.js --out-file BaseWidget.Babel.js --presets=env
ECHO.
ECHO 	descrition:
ECHO 	-----------
ECHO 	above example going to find BaseWidget.js file and compile it into old js structure and put final
ECHO 	code in BaseWidget.Babel.js file in current folder. 
ECHO.
ECHO Reference
ECHO ----------
ECHO 	https://babeljs.io/
ECHO.
ECHO Contact Info
ECHO -------------
ECHO 	Author: Hadi Khazaee Asl
ECHO 	Email: Hadi_Khazaee_asl@yahoo.com
ECHO.
ECHO Donate
ECHO -------
ECHO 	- Bitcoin: 1Nfm5ZYXXfUZk4pzDN7KzZBFnuxDNUMvKo
ECHO.

GOTO end


@rem Calls when user need to Delete Output File
:deleteOutputFile
ECHO.
ECHO %outputFile% exists ...

SET /P command="Delete [y/n]: "

IF %command% == y GOTO handleDelete
IF %command% == Y GOTO handleDelete
GOTO showHelpAndEndFinish

:handleDelete
ECHO Deleting %outputFile% ...
DEL %outputFile%

GOTO startBabelizing


@rem start Babelize file
:startBabelizing
ECHO.
ECHO Start Babelizing ...
SET runCommand=npx babel %inputFile% --out-file %outputFile% --presets=env
@ECHO OFF
CALL %runCommand% >> SaherElmTool.log 2>&1
ECHO.
IF %errorlevel% NEQ 0 GOTO endError

ECHO Finish ...
ECHO.
GOTO end






@rem a Handler which calls when user input invalid args ...
:invalidArgs
ECHO.
ECHO SaherElm IT Center Babelize Tool 
ECHO --------------------------------
ECHO.
ECHO Invalid Args ...
GOTO showHelpAndEndError


@rem Calls When Input File Doesn't Exists ...
:inputFileNotFound
ECHO.
ECHO input file doesn't exists ...
GOTO showHelpAndEndError


@rem if inputFile and output file are same file ...
:sameFileError
ECHO.
ECHO SaherElm IT Center Babelize Tool 
ECHO --------------------------------
ECHO.
ECHO Enter Same File as input and output File name ...
GOTO showHelpAndEndError








@rem a Handler which shown help param and end execute with success code ...
:showHelpAndEndFinish
ECHO. 
ECHO.for review usage of this tool using -h
ECHO.
GOTO end


@rem a Handler which shown help param and end execute with error code ...
:showHelpAndEndError
ECHO. 
ECHO.for review usage of this tool using -h
ECHO.
GOTO endError









@rem end of Application ...
:end
EXIT /B 0

@rem End if an Error Happens ... 
:endError
EXIT /B 1
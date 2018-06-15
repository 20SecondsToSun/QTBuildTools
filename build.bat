@echo Batch file for auto build

@echo Set project identity variables
set PROJECTNAME=FamilyLauncherApp
set BUILD_DIR=C:\FamilyAgencySSD\Builds\Qt\SynapseLauncher\

@echo Set executable locations
set QT_DIR=D:\ProgramFiles\Qt\5.9.5\msvc2015
set QT_CREATORDIR=D:\ProgramFiles\Qt\Tools\QtCreator

@echo Set internal variables
set SRCDIR=C:\FamilyAgencySSD\Builds\Qt\SynapseLauncher\
set PATH=%QT_DIR%\bin;%QT_CREATOR_DIR%/bin;%PATH%

@echo Setup build directory
mkdir %BUILD_DIR%
cd %BUILD_DIR%

@echo Initialise builds
cd C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC
call vcvarsall.bat x86

@echo Build project
cd %SRCDIR%
qmake.exe %SRCDIR%\%PROJECTNAME%.pro -spec win32-msvc "CONFIG+=debug" "CONFIG+=qml_debug" && jom.exe qmake_all
D:\ProgramFiles\Qt\Tools\QtCreator\bin\jom.exe 
D:\ProgramFiles\Qt\Tools\QtCreator\bin\jom.exe clean

@echo Build release
set WINDEPLOYQT_EXE=%QT_DIR%\bin\windeployqt.exe
set RELEASE_DIR=%SRCDIR%\debug
set QML_DIR=%SRCDIR%
%WINDEPLOYQT_EXE% --debug --qmldir %QML_DIR% %RELEASE_DIR%\%PROJECTNAME%.exe
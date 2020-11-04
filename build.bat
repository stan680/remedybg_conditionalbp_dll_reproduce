@echo off

:; directory containing this script and source
set ROOT=%~dp0

set COMPILE_FLAGS=-nologo -Zi -FC -GR- -EHa- -Oi -MTd -Od
set LINK_FLAGS=-subsystem:windows,5.2 -OPT:REF -incremental:no

if not exist %ROOT%\build ( mkdir %ROOT%\build )
pushd %ROOT%\build

:; build library dll
cl %ROOT%\library.cpp %COMPILE_FLAGS% /LDd /link %LINK_FLAGS% /EXPORT:library_function

:; build executable
cl %ROOT%\main.cpp %COMPILE_FLAGS% /link %LINK_FLAGS%

popd

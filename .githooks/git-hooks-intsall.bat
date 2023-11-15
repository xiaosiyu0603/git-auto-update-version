:: run as admin under .githooks\
cd /d %~dp0
rename ..\.git\hooks hooks.%random%.bak 2> NUL
mklink /d ..\.git\hooks ..\.githooks

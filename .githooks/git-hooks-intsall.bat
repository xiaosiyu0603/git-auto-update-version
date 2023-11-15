:: run as admin under .githooks\
rd /s /q ..\.git\hooks.bak 2> NUL
rename ..\.git\hooks hooks.bak
mklink /d ..\.git\hooks ..\.githooks

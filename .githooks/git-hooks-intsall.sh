#!/usr/bin/bash
mv ../.git/hooks ../.git/hooks.$RANDOM.bak
ln -s ../.githooks ../.git/hooks

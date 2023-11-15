#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from datetime import datetime

# print(datetime.now())

strnow = datetime.now().isoformat()

with open("version.py", 'r', encoding='utf-8') as fp:
    lines = fp.readlines()
    for i, line in enumerate(lines):
        if line.startswith("VERSION ="):
            lines[i] = f"VERSION = \"{strnow}\"\n"

with open("version.py", 'w', encoding='utf-8') as fp:
    fp.writelines(lines)

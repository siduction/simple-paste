#!/bin/bash

VER=0.1.0

git changelog  --prune-old \
               --stdout \
               --no-merges \
               --final-tag "$VER" \
               > CHANGELOG

git add CHANGELOG

git commit -m "Release $VER" \
           -m "" \
           -m "Release-Changelog $VER created"

git tag --force \
        --sign "$VER" \
        -m "Release $VER"

git push --all
git push --tags

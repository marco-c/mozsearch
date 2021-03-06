#!/usr/bin/env bash

set -x # Show commands
set -eu # Errors/undefined vars are fatal
set -o pipefail # Check all commands in a pipeline

mkdir -p $INDEX_ROOT/analysis
mkdir -p $INDEX_ROOT/file
mkdir -p $INDEX_ROOT/dir
mkdir -p $INDEX_ROOT/description

mkdir -p $INDEX_ROOT/analysis/__GENERATED__

set +x # This part is annoyingly verbose, silence commands and use manual echo statement
cat $INDEX_ROOT/repo-dirs | while IFS= read dir
do
    echo "Making {file,dir,analysis,description} dirs for $dir"
    mkdir -p "$INDEX_ROOT/file/$dir"
    mkdir -p "$INDEX_ROOT/dir/$dir"
    mkdir -p "$INDEX_ROOT/analysis/$dir"
    mkdir -p "$INDEX_ROOT/description/$dir"
done
set -x
mkdir -p $INDEX_ROOT/templates

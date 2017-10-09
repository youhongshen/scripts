#!/usr/bin/env bash

# When a venv is created, the activate directory is hardcoded, this makes it hard to port the venv
# to a different directory.

# cd <venv>/bin
# assume the venv is originally created under /home/joan

# this script does not need to be executed every time

orig_dir="/home/joan"

grep $orig_dir * | egrep -v "create_templates.sh|modify_env.sh" | while read x
do
    file=$(echo $x | cut -d":" -f1)
    echo "=== $file ==="
    sed -e "s|$orig_dir|__VENV_DIR__|" $file > $file.template
done

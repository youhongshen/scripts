#!/usr/bin/env bash

if [[ -z $1 ]]
then
    echo "usage: $0 <target ansible env dir> ex: modify_env.sh /home/joan"
    exit 1
fi

target_dir=$1

template_str="__VENV_DIR__"

grep $template_str * | egrep -v "create_templates.sh|modify_env.sh" | while read x
do
    template_file=$(echo $x | cut -d":" -f1)
    file=`echo ${template_file%%.template}`
    echo "$template_file $file"
    sed -e "s|$template_str|$target_dir|" $template_file > $file
done

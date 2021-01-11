#! /bin/bash

if [[ $# -ne "1" ]]; then
  echo "Which folder you want to install?"
  exit 1
fi

theme_dir=$1
theme_name=$(basename "$theme_dir")

if [[ ! -d "$theme_dir" ]]; then
  echo "$theme_dir doesn't exist"
  exit 1
fi

if [[ ! -f "$theme_dir/cursor.theme" ]]; then
  echo "$theme_dir/cursor.theme are you sure its a theme?"
  exit 1
fi

if [[ ! -f "$theme_dir/index.theme" ]]; then
  echo "$theme_dir/index.theme are you sure its a theme?"
  exit 1
fi

if [[ ! -d "$theme_dir/xcursors" ]]; then
  echo "$theme_dir/xcursors does not exist. Did you pngs/make.sh it?"
  exit 1
fi

install_at="/usr/share/icons"

if [[ -d "$install_at/$theme_name" ]]; then
  echo "$theme_name already installed."
  echo "If you really want to reinstall make sure to remove it from $install_at manually. Thanks"
  exit 1
fi

echo "Alright, installing $theme_name into $install_at"
echo ""
echo "You can select it later through desktop settings"

sudo mkdir "$install_at/$theme_name"
sudo cp -r "$theme_dir/xcursors" "$install_at/$theme_name/cursors"
sudo cp "$theme_dir/index.theme" "$install_at/$theme_name/"
sudo cp "$theme_dir/cursor.theme" "$install_at/$theme_name/"

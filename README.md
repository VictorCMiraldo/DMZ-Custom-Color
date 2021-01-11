# DMZ-Custom-Color

Uses the DMZ-White cursor files from `https://salsa.debian.org/gnome-team/dmz-cursor-theme` and imagemagick's `mogrify` to 
recolorize the white cursors to whatever color you'd like.

Currently its all pretty manual, since I just wanted a yellow cursor.

Still, it's easy enough to use. The `run.sh` script will copy over the `DMZ-White`
theme into a `DMZ-Yellow` folder and recolorize each png using the `recolorize-one.sh` script.
After this is all said and done, you need to manually change the theme files in `DMZ-Yellow` to
reflect the correct name. Finally, you need to run `DMZ-Yellow/pngs/make.sh` to generate the Xcursor files.

To use a different color change the relevant bit in `recolorize-one.sh`.

The `install-cursor-theme.sh` performs minimal checks and copies the relevant files to
`/usr/share/icons`. Don't forget to change your `/usr/share/icons/default/index.theme` to
something like:

```
[Icon Theme]
Inherits=dmz-yellow
```

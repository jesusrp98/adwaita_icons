#!/bin/sh

# Location of the folder where all 'adwaita' icons reside.
ORIGINAL_ICONS_SRC="adwaita-icon-theme/Adwaita/scalable"

# Here we'll copy every adwaita icon to make life easier to icon_font_generator
TEMP_ICONS_FOLDER="temp_adwaita_icons"

# Output file where the code will be generated
LIBRARY_OUTPUT="lib/src/adwaita_icons.dart"

if ! command -v icon_font_generator >/dev/null
then
    printf "\nPlease install icon_font_generator (see README.md)\n\n"
    exit 1
fi

mkdir $TEMP_ICONS_FOLDER

find $ORIGINAL_ICONS_SRC -name '*.svg' -print0 | xargs -0 -I{} -n 1 cp -a {} $TEMP_ICONS_FOLDER;

icon_font_generator --from=$TEMP_ICONS_FOLDER \
                    --class-name=AdwaitaIcons \
                    --out-font=assets/fonts/adwaita_icons.ttf \
                    --out-flutter=$LIBRARY_OUTPUT \
                    --package=adwaita_icons \
                    --naming-strategy=snake \
		    --normalize

rm -rf $TEMP_ICONS_FOLDER
# Make AdwaitaIconsData class publicly accesible
sed -i "s/_A/A/g" $LIBRARY_OUTPUT
flutter format $LIBRARY_OUTPUT

#!/bin/sh

# Location of the folder where all 'adwaita' icons reside.
ICONS_FOLDER="adwaita-icon-theme/Adwaita/scalable"

# Output file where the code will be generated
LIBRARY_OUTPUT="lib/src/adwaita_icons.dart"

if ! command -v icon_font_generator >/dev/null
then
    printf "\nPlease install icon_font_generator (see README.md)\n\n"
    exit 1
fi

icon_font_generator --from=$ICONS_FOLDER \
                    --class-name=AdwaitaIcons \
                    --out-font=assets/fonts/adwaita_icons.ttf \
                    --out-flutter=$LIBRARY_OUTPUT \
                    --package=adwaita_icons \
                    --naming-strategy=snake

flutter format $LIBRARY_OUTPUT
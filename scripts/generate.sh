#!/bin/bash

# Location of the folder where all 'adwaita' icons reside.
ICONS_FOLDER="../assets/icons"

# Output file where all the paths for the icons reside. This is used to
# build an 'icon widget' within Flutter, using the 'flutter_svg' package.
LIBRARY_OUTPUT="../lib/src/icon_library.dart"

# Output file where a list containing all icon paths will be placed.
# This list will be used for the 'example' project available inside this package.
LIST_OUTPUT="../example/lib/icon_library.dart"

# First we print file headers for each output
echo -e "class AdwaitaIcons {const AdwaitaIcons._();\n" >$LIBRARY_OUTPUT
echo "const adwaitaIconPaths = [" >$LIST_OUTPUT

for icon in "$ICONS_FOLDER"/*; do
    icon_filename="$(basename "$icon")"

    if [[ $icon_filename =~ (.+)-symbolic.svg ]]; then
        icon_name=${BASH_REMATCH[1]}
    else
        echo "unable to parse string $strname"
    fi
    final_icon_name=$(echo "$icon_name" | tr '-' '_')

    # Print each icon to the 'library' file
    echo -n "static const " >>$LIBRARY_OUTPUT
    echo -n $final_icon_name >>$LIBRARY_OUTPUT
    echo -n "=\"" >>$LIBRARY_OUTPUT
    echo -n $(realpath --relative-to=.. "$icon") >>$LIBRARY_OUTPUT
    echo "\";" >>$LIBRARY_OUTPUT

    # Print each icon to the 'list' file
    echo -n "\"" >>$LIST_OUTPUT
    echo -n $(realpath --relative-to=.. "$icon") >>$LIST_OUTPUT
    echo -n "\"" >>$LIST_OUTPUT
    echo "," >>$LIST_OUTPUT
done

echo "}" >>$LIBRARY_OUTPUT
echo "];" >>$LIST_OUTPUT

# Lastly, we format both output files using Flutter's tools.
flutter format $LIBRARY_OUTPUT
flutter format $LIST_OUTPUT

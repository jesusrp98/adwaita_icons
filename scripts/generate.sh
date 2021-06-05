#!/bin/bash

ICONS_FOLDER="../assets/icons"
LIBRARY_OUTPUT="../lib/src/icon_library.dart"
LIST_OUTPUT="../example/lib/icon_library.dart"

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

    # library
    echo -n "static const " >>$LIBRARY_OUTPUT
    echo -n $final_icon_name >>$LIBRARY_OUTPUT
    echo -n "=\"" >>$LIBRARY_OUTPUT
    echo -n $(realpath --relative-to=.. "$icon") >>$LIBRARY_OUTPUT
    echo "\";" >>$LIBRARY_OUTPUT

    # list
    echo -n "\"" >>$LIST_OUTPUT
    echo -n $(realpath --relative-to=.. "$icon") >>$LIST_OUTPUT
    echo -n "\"" >>$LIST_OUTPUT
    echo "," >>$LIST_OUTPUT
done

echo "}" >>$LIBRARY_OUTPUT
echo "];" >>$LIST_OUTPUT

flutter format $LIBRARY_OUTPUT
flutter format $LIST_OUTPUT

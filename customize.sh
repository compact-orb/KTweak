#!/system/bin/sh

SCRIPT_NAME="ktweak"
SCRIPT_PATH="$MODPATH/$SCRIPT_NAME"

ui_print " * Setting executable permissions..."
set_perm_recursive "$SCRIPT_PATH" root root 0777 0755

ui_print " * Executing script immediately..."
sh "$SCRIPT_PATH"

ui_print ""
ui_print " --- Additional Notes ---"
ui_print ""
ui_print " * Reinstall to update the script"
ui_print " * Rebooting is not required"
ui_print " * Do not use with other optimizer modules"
ui_print ""

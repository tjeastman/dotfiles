#!/bin/sh

program=$0
new_profile_name=$1
new_profile_settings_file=$2
dconf=/usr/bin/dconf
uuidgen=/usr/bin/uuidgen
gnome_terminal_profiles=/org/gnome/terminal/legacy/profiles:

error() {
    echo $1 >&2
    exit 1
}

usage() {
    error "Usage: $program new_profile_name new_profile_settings_file"
}

dconf_unquote() {
    echo $1 | sed -e s/^\'// -e s/\'$//
}

dconf_quote() {
    echo "'$1'"
}

dconf_read() {
    echo $(dconf_unquote $($dconf read $1))
}

dconf_write() {
    $dconf write $1 $(dconf_quote $2)
}

dconf_load() {
    $dconf load $1 < $2
}

dconf_delist() {
    echo $1 | sed -e s/\\\[// -e s/\]//
}

dconf_list() {
    echo "[$1]"
}

dconf_append() {
    list=$($dconf read $1)
    items=$(dconf_delist "$list")
    item=$(dconf_quote $2)
    list=$(dconf_list "$items, $item")
    $dconf write $1 "$list"
}

dconf_split() {
    echo $1 | sed 's/, / /g'
}

dconf_each() {
    list=$($dconf read $1)
    items=$(dconf_delist "$list")
    for item in $(dconf_split "$items"); do
        echo $(dconf_unquote $item)
    done
}

get_new_profile() {
    echo $($uuidgen)
}

# ensure that the new profile and settings file are valid
if [ -z $new_profile_name ]; then
    usage
elif [ -z $new_profile_settings_file ]; then
    usage
elif [ ! -f $new_profile_settings_file ]; then
    error "File $new_profile_settings_file does not exist."
elif [ ! -r $new_profile_settings_file ]; then
    error "File $new_profile_settings_file is not readable."
fi

# ensure that the new profile name is unique
for profile in $(dconf_each $gnome_terminal_profiles/list); do
    profile_name=$(dconf_read $gnome_terminal_profiles/:$profile/visible-name)
    if [ "$new_profile_name" = "$profile_name" ]; then
        error "Profile '$new_profile_name' already exists."
    fi
done

# create a new profile and apply the requested settings
new_profile=$(get_new_profile)
dconf_load $gnome_terminal_profiles/:$new_profile/ $new_profile_settings_file
dconf_write $gnome_terminal_profiles/:$new_profile/visible-name $new_profile_name
dconf_append $gnome_terminal_profiles/list $new_profile
dconf_write $gnome_terminal_profiles/default $new_profile

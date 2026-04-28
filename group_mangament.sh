#!/bin/bash
# Created by MichaelCode-tech
# --- Functions ---

create_group(){
    while true; do
        clear
        echo "======= Create Group ======="
        echo "1. Create a new group"
        echo "0. Back to Group Menu"
        read -p "Choose: " sub_choose
        
        case $sub_choose in
            0) return ;; # يرجع للمكان اللي اتنادى منه
            1)
                read -p "Enter the group name: " group_name
                read -p "Do you want a specific GID? (y/N): " want_gid
                case $want_gid in
                    y|Y|yes|YES)
                        read -p "Enter the GID you want: " gid
                        sudo groupadd -g "$gid" "$group_name" && echo "Group created successfully!"
                        ;;
                    *)
                        sudo groupadd "$group_name" && echo "Group created successfully!"
                        ;;
                esac
                sleep 1
                ;;
            *) echo "Please enter a valid choice" ; sleep 1 ;;
        esac
    done
}

delete_group(){
    clear
    echo "======= Delete Group ======="
    # عرض المجموعات العادية (GID >= 2000)
    awk -F: '$3 >= 2000 {print $1}' /etc/group
    echo "############################"
    read -p "Enter group name to delete (or '0' to cancel): " delete_name
    if [ "$delete_name" != "0" ]; then
        sudo groupdel -f "$delete_name" && echo "Deleted successfully"
    fi
    sleep 1
}

show_normal_groups(){
    clear
    echo "======= Normal Groups (GID >= 2000) ======="
    awk -F: '$3 >= 2000 {print $1 " (GID: "$3")"}' /etc/group
    echo "###########################################"
    read -p "Press Enter to return..." 
}

modify_groups(){
    while true; do
        clear
        echo "======= Modify Groups ======="
        echo "1. Rename group"
        echo "2. Set group password"
        echo "3. Change Group ID (GID)"
        echo "0. Back to Group Menu"
        read -p "Choose: " mod_choose
        
        case $mod_choose in
            0) return ;;
            1)
                read -p "Enter old group name: " old_name
                read -p "Enter new group name: " new_name
                sudo groupmod -n "$new_name" "$old_name" && echo "Renamed successfully"
                ;;
            2)
                read -p "Enter group name to set password: " pass_group
                sudo gpasswd "$pass_group"
                ;;
            3)
                read -p "Enter group name: " gid_group
                read -p "Enter new GID: " new_gid
                sudo groupmod -g "$new_gid" "$gid_group" && echo "GID updated"
                ;;
            *) echo "Invalid choice" ;;
        esac
        sleep 1
    done
}

group_list_users(){
    clear
    read -p "Enter group name to list its users: " gname
    echo "Users in $gname: "
    grep "^$gname:" /etc/group | cut -d: -f4
    read -p "Press Enter to continue..."
}

group_menu(){
    while true; do
        clear
        echo "======= Group Management Menu ========"
        echo "1. Create group"
        echo "2. Delete group"
        echo "3. Show all normal groups"
        echo "4. Modify Group"
        echo "5. List users in a group"
        echo "0. Return to Main Menu"
        read -p "Choose: " choice
        
        case $choice in
            1) create_group ;;
            2) delete_group ;;
            3) show_normal_groups ;;
            4) modify_groups ;;
            5) group_list_users ;;
            0) break ;; # يكسر اللوب ويرجع لـ main_menu
            *) echo "Invalid option" ; sleep 1 ;;
        esac
    done
}

main_menu(){
    while true; do
        clear
        echo "======= Main Menu ======="
        echo "1. Modify Groups"
        echo "2. Exit"
        read -p "Choose: " main_choose
        
        case $main_choose in
            1|Groups|modify) group_menu ;;
            2|exit|Exit) echo "Goodbye!" ; exit 0 ;;
            *) echo "Invalid option" ; sleep 1 ;;
        esac
    done
}

# --- Start the Script ---
main_menu

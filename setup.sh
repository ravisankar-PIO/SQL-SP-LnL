#!/QOpenSys/usr/bin/bash
# ------------------------------------------------------------------------- #
# Program       : setup.sh
# Author        : Ravisankar Pandian
# Company       : Programmers.io
# Date Written  : 07/30/2024
# Copyright     : Programmers.io
# ------------------------------------------------------------------------- #

# Function to print the progress bar characters.
progress_bar() {
    local total_work=$1
    local work_done=$2
    local progress=$((work_done*20/total_work))  # 20 because 100/5=20
    local filled_part=$(printf "%${progress}s" "")
    local empty_part=$(printf "%$((20-progress))s" "")  # 20 because 100/5=20
    printf "|%s%s| %s%%\r" "${filled_part// /#}" "${empty_part}" "$((work_done*100/total_work))"
}

# Function to show the progress bar
showProgress(){
total_work=$1
work_done=0
while [ $work_done -lt $total_work ]; do
    # Simulate some work with sleep
    /QOpenSys/pkgs/bin/sleep 0.1
    work_done=$((work_done+1))
    progress_bar $total_work $work_done
done
echo ""  # Newline after progress bar
}


# Function to make some gap between every action
printheading(){
    echo -e "\n" 
    echo "==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-=="
    echo "$1"
    echo "==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-=="
}

# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# create a .profile file in your home folder to store the environment variables.
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
printheading "Setup the environment variables..."
showProgress 10
/QOpenSys/pkgs/bin/chsh -s /QOpenSys/pkgs/bin/bash $USER
cd ~
echo "export PATH=/QOpenSys/pkgs/bin:$PATH" >> .profile

source ~/.profile


# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# Update and upgrade the open source packages
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
printheading "Update the yum repository and existing packages..."
yum update -y  
yum install ibmi-repos -y
yum install bob



# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# Install GIT
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
printheading "Setup GIT..."
yum install git -y
git config --global user.name 'Ravisankar Pandian' 
git config --global user.email ravisankar.pandian@programmers.io

# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# Generate SSH Keys
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
printheading "Generate SSH Keypairs..."
ssh-keygen -t ed25519 -C "ravisankar.pandian@programmers.io" -f ~/.ssh/id_ed25519 -N ""

# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# Generate Sample Data
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
system "CRTLIB LIB(CMPSYS) TEXT('Better Object Builder test project')"
git clone https://github.com/ravisankar-PIO/cmpsys
cd cmpsys
export CURLIB=CMPSYS
makei build


# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# Clone the required repository
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
cd ~ 
git clone https://github.com/ravisankar-PIO/SQL-SP-LnL

# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
# All done!
# ==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==
echo -e "\n\n"
echo -e '|============================================================|'
echo -e '| Initial setup for is completed!                            |'
echo -e '|============================================================|'
echo -e "\n\n"

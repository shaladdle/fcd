# Function for fast directory switch. Put this in your bashrc.
function fc {
    eval cd $($HOME/bin/fcd "$1")
}

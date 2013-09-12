# Function for fast directory switch
function fc {
    eval cd $($HOME/bin/fc "$1")
}

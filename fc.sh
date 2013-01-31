FCDIR=$HOME/utils/fc
function fc {
	eval cd "$(ruby $FCDIR/fc.rb $FCDFINDER "$1" 10)"
}

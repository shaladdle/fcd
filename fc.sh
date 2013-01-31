FCDIR=$HOME/utils/fc
FCDFINDER=locate
function fc {
	eval cd "$(ruby $FCDIR/fc.rb $FCDFINDER "$1" 10)"
}

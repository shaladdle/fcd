# Right now this uses some hackishness by printing some stuff to STDERR

# Args
# 0 - find utility, I should be able to do ARGV[0] pattern and get a list of newline-separated results
# 1 - search pattern
# 2 - maximum number of choices

# Function for finding stuff. Finder should be platform specific
def find(findcmd, pattern)
	ret = %x{bash -lic '#{findcmd} #{pattern}'}.split("\n")
	ret = ret.reject { |i| !File::directory?(i) }
	return ret
end

def myexit(status)
	exit status
end

def write_dest(dest)
	dest = dest.gsub(/ /, "\\ ")
	puts dest
	# puts "\"#{dest}\""
end

# Actually do the find
res = find(ARGV.shift, ARGV.shift)

maxrows = Integer(ARGV.shift)

if not res.any?
	myexit 1
elsif res.length == 1
	write_dest(res[0])
	myexit 0
elsif res.length > maxrows
	res = res[0..maxrows-1]
	STDERR.puts
	STDERR.puts "WARNING, more than #{maxrows} results"
	STDERR.puts
end

res.each_with_index { |s,i| 
	STDERR.puts "#{i+1}. #{s}"
}

# Ask which one to use
STDERR.puts "Choose one"
sel = Integer(STDIN.gets)

# Output the chosen directory
write_dest(res[sel-1])
myexit 0

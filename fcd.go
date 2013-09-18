package main

import (
	"./search"
	"flag"
	"fmt"
	"log"
	"os"
)

var (
	timeit = flag.Bool("time", false, "whether or not to print out timing statistics after running")
)

func main() {
	flag.Parse()

	pattern := flag.Arg(0)
	if pattern == "" {
		log.Fatal("Cannot pass \"\" as a pattern")
	}

	searchResults, err := search.Search(pattern)
	if err != nil {
		log.Fatal("Error in search: ", err)
	}

	for _, s := range searchResults {
		if info, err := os.Stat(s); err != nil {
			log.Fatal(err)
		} else if info.IsDir() {
			if info.Name() == pattern {
				fmt.Println(s)
				return
			}
		}
	}
}

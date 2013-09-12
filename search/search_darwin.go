package search

import (
    "fmt"
    "os/exec"
)

func createCommand(pattern string) *exec.Cmd {
    return exec.Command("mdfind", fmt.Sprintf("kMDItemDisplayName == '%v'cd", pattern))
}

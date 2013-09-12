package search

import (
    "os/exec"
)

func createCommand(pattern string) *exec.Cmd {
    return exec.Command("locate", pattern)
}

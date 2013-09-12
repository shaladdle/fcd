package search

import (
    "io"
    "fmt"
    "bufio"
)

func Search(pattern string) ([]string, error) {
    cmd := createCommand(pattern)
    stdout, err := cmd.StdoutPipe()
    if err != nil {
        return nil, fmt.Errorf("StdoutPipe error %v", err)
    }
    defer stdout.Close()

    if err := cmd.Start(); err != nil {
        return nil, fmt.Errorf("error running command: %v", err)
    }

    ret := []string{}
    r := bufio.NewReader(stdout)
    for {
        line, isPrefix, err := r.ReadLine()
        if err == io.EOF {
            return ret, nil
        } else if err != nil  {
            return nil, fmt.Errorf("ReadLine error: %v", err)
        } else if isPrefix {
            panic("isprefix")
        } else {
            ret = append(ret, string(line))
        }
    }

    return ret, nil
}

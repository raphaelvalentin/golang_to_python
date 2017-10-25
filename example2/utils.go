package main

import "C"

import (
    "regexp"
    "strings"
    "strconv"
)

//export go_version_to_int
func go_version_to_int (s string) int {
    chunks := strings.Split(s, ".")
    val := make([]int, len(chunks))
     for i, v := range chunks {
        val[i], _ = strconv.Atoi(v)
     }
    return (val[0] << 16) | (val[1] << 8) | val[2]
}

//export go_get_version
func go_get_version(s string) int {
    _version_search, _ := regexp.Compile(`version\s*:\s*(\d+\.\d+\.\d+)`)
    res := _version_search.FindStringSubmatch(s)
    if len(res) != 0 {
        val := go_version_to_int(res[1])
        return val
    }
    return -1
}

func main() {}
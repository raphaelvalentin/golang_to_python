package main

import "C"

import (
)

//export searchsorted
func searchsorted(array []float64, target float64, lowIndex int, highIndex int) int {
    startIndex := lowIndex
    endIndex := highIndex
    var mid int
    for startIndex < endIndex {
        mid = int((startIndex + endIndex) / 2)
        if target < array[mid] {
            endIndex = mid
        } else if target > array[mid]  {
            if startIndex == mid {
                return mid
            }
            startIndex = mid
        } else {
            return mid
        }
    }
    return -1
}

func main() {
}

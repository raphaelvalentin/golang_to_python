package main

import "C"

import (
)

//export binarySearch
func binarySearch(array []float64, target float64, lowIndex int, highIndex int) int {
	startIndex := lowIndex
	endIndex := highIndex
	var mid int
	for startIndex < endIndex {
		mid = int((startIndex + endIndex) / 2)
		if array[mid] == target {
            return mid
		} else if target > array[mid]  {
            if startIndex == mid {
                return mid
            }
			startIndex = mid
		} else {
			endIndex = mid
		}
	}
	return -1
}

func main() {
}

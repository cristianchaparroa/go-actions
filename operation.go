package main

import "fmt"

func sum(a,b int) int {
 return a + b
}

func IsError() bool {
	is, _  := retError()
   return is
}

func retError() (bool, error) {
	return false, nil
}

func veryComplex(names, lasts []string, version, year string, shouldAdd bool) []string {
	messages := make([]string, 0)

	for _, name := range names {
		for _, last := range  lasts{
			if shouldAdd {
				message := fmt.Sprintf("%s%s-%s", name, last, year)
				messages = append(messages, message)
			} else {

			}
		}
	}

	return messages
}

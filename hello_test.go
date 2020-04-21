package main

import "testing"

func TestGreetsGitHub(t *testing.T) {
    result := Greet()
    if result != "Hello Cache" {
        t.Errorf("Greet() = %s; want Hello GitHub actions", result)
    }
}

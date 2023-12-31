// simple web app
package main

import (
    "fmt"
    "log"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello");
}

func pingHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "ping");
}

func main() {
    http.HandleFunc("/ping", pingHandler)
    http.HandleFunc("/", handler)
    log.Fatal(http.ListenAndServe(":8000", nil))
}

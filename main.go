package main

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
	"os"
)

type BadResponse struct {
	Error string `json:"error,omitempty"`
}

func main() {
	http.HandleFunc("/", homeHandler)
	log.Println("server start")
	http.ListenAndServe(":8080", nil)
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	file, err := os.Open("home.txt")
	if err != nil {
		createBadRequest(err.Error(), &w)
		return
	}
	defer file.Close()

	fileText, err := io.ReadAll(file)
	if err != nil {
		createBadRequest(err.Error(), &w)
		return
	}

	w.Write(fileText)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
}

func createBadRequest(errMessage string, w *http.ResponseWriter) {
	response := BadResponse{Error: errMessage}
	err := json.NewEncoder(*w).Encode(response)
	if err != nil {
		panic(err)
	}
	(*w).Header().Set("Content-Type", "application/json")
	(*w).WriteHeader(http.StatusBadRequest)
}

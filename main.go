package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"wsf/CoursDevops/handler"
)

func main() {

	// connection := os.Getenv("DATABASE_URL")

	port := os.Getenv("PORT") // le port est égale à celui définit par Heroku
	if port == "" {
		port = "8080"
	}

	myHandler := handler.NewHandler()

	server := &http.Server{
		Addr:    ":" + port,
		Handler: myHandler,
		// ReadTimeout:  10 * time.Second,
		// WriteTimeout: 10 * time.Second,
	}

	fmt.Println("it is okkkkkkkkkkkkkk 2")
	fmt.Println("Server is running at", port)

	log.Fatal(server.ListenAndServe())
}

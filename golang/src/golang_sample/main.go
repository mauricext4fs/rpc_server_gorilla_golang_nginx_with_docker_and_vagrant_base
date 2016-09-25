package main

import (
	"github.com/gorilla/mux"
	"github.com/gorilla/rpc"
	"github.com/gorilla/rpc/json"
	"golang_sample/service"
	"log"
	"net/http"
)

func main() {
	initRpcServer()
}

func initRpcServer() {
	r := mux.NewRouter()

	s := rpc.NewServer()
	s.RegisterCodec(json.NewCodec(), "application/json")

	// All RPC service must be reigstered here
	s.RegisterService(new(service.Registration), "")

	r.Handle("/rpc", s)
	log.Println(http.ListenAndServe(":1234", r))
}

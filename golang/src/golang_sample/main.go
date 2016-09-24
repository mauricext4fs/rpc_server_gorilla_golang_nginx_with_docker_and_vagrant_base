package main

import (
	"flag"
	"github.com/gorilla/mux"
	"github.com/gorilla/rpc"
	"github.com/gorilla/rpc/json"
	"golang_sample/service"
	"log"
	"net/http"
)

// Let us set the listening host and port from
// the command line with -addr
var addr = flag.String("addr", ":1234", "http service address") // Q=17, R=18

func main() {
	initRpcServer()
}

func initRpcServer() {
	r := mux.NewRouter()

	s := rpc.NewServer()
	s.RegisterCodec(json.NewCodec(), "application/json")

	s.RegisterService(new(service.Registration), "")

	r.Handle("/rpc", s)
	log.Println(http.ListenAndServe(*addr, r))
}

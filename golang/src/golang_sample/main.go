package main

import (
	_ "expvar"
	"flag"
	"log"
	"net/http"
	_ "net/http/pprof"
	"os"

	"github.com/bakins/net-http-recover"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"github.com/gorilla/rpc"
	"github.com/gorilla/rpc/json"
	"github.com/justinas/alice"

	"golang_sample/service"
)

// Let us set the listening host and port from
// the command line with -addr
var addr = flag.String("addr", ":1234", "http service address") // Q=17, R=18

func main() {
	//initHttpRouter()
	initRpcServer()
}

func initRpcServer() {
	r := mux.NewRouter()

	s := rpc.NewServer()
	s.RegisterCodec(json.NewCodec(), "application/json")

	s.RegisterService(new(service.Registration), "")

	chain := alice.New(
		func(h http.Handler) http.Handler {
			return handlers.CombinedLoggingHandler(os.Stdout, h)
		},
		func(h http.Handler) http.Handler {
			return handlers.ProxyHeaders(h)
		},
		handlers.CompressHandler,
		func(h http.Handler) http.Handler {
			return recovery.Handler(os.Stderr, h, true)
		})

	// httprof and expvar endpoints
	//r.PathPrefix("/debug/").Handler(chain.Then(http.DefaultServeMux))

	r.Handle("/rpc", chain.Then(s))
	log.Println(http.ListenAndServe(":1234", r))
}

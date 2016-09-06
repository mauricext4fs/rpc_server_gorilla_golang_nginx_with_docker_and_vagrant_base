package main

import (
	"database/sql"
	_ "expvar"
	"flag"
	"fmt"
	_ "github.com/lib/pq"
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

var db *sql.DB

func main() {
	initDb()
	//initHttpRouter()
	initRpcServer()
	defer db.Close()
}

func initRpcServer() {
	r := mux.NewRouter()

	s := rpc.NewServer()
	s.RegisterCodec(json.NewCodec(), "application/json")

	s.RegisterService(new(service.Registration), "")
	s.RegisterService(new(service.Arith), "")

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
	r.PathPrefix("/debug/").Handler(chain.Then(http.DefaultServeMux))

	r.Handle("/rpc", chain.Then(s))
	http.Handle("/vlad", http.HandlerFunc(register))
	log.Println(http.ListenAndServe(":1234", r))
}

func initDb() {
	var err error
	dbinfo := fmt.Sprintf("host=172.17.0.1 port=5433 user=%s password=%s dbname=%s sslmode=disable",
		"postgres", "**7/ClydeAVALON$$", "micl")
	db, err = sql.Open("postgres", dbinfo)
	checkErr(err)
}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}

func register(w http.ResponseWriter, req *http.Request) {
	url := req.FormValue("url")
	addMicl(url)
	fmt.Println("Url? =", req.FormValue("firstname"))
	//templ.Execute(w, req.FormValue("s"))
	defer req.Body.Close()
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-Type", "application/json")
	//w.Write("{\"jolo\":\"yolo\"}")
}

func addMicl(url string) {
	var lastInsertId int
	var err error
	err = db.QueryRow("INSERT INTO micl (url) VALUES($1) returning id;", url).Scan(&lastInsertId)
	checkErr(err)
}

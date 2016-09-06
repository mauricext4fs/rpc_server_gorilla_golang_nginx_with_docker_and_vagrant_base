package service

import (
	"fmt"
	"log"
	"net/http"
)

//Holds arguments to be passed to service Arith in RPC call
type RegistrationArgs struct {
	Firstname, Lastname, Email, Micl_uuid, Url string
}

type Args struct {
	A, B int
}

//Representss service Arith with method Multiply
type Registration string

type Arith int

type VladResult Vlad

type Result int

type Vlad struct {
	Uuid, Time string
}

//This procedure is invoked by rpc and calls rpcexample.Multiply which stores product of args.A and args.B in result pointer
func (t *Registration) Add(r *http.Request, args *RegistrationArgs, result *Vlad) error {
	fmt.Println("Something is comming! ", args)
	//result = &Vlad{uuid: "yolo", time: "bleue"}
	result.Uuid = "uuid result in String"
	result.Time = "time result in String"
	fmt.Println("result: ", result)
	return nil
}

func (t *Arith) Multiply(r *http.Request, args *Args, result *Result) error {
	log.Printf("Multiplying %d with %d\n", args.A, args.B)
	*result = Result(args.A * args.B)
	return nil
}

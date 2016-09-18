package service

import (
	"fmt"
	"golang_sample/db"
	"net/http"
)

//Represents service Registration
type Registration string

type Result struct {
	NewId int
	Msg   string
}

type Error struct {
	s string
}

//This procedure is invoked by rpc and calls rpcexample.Multiply which stores product of args.A and args.B in result pointer
func (t *Registration) Add(r *http.Request, args *db.User, result *Result) error {
	/*
	 Not allowing Empty Firstname and Lastname
	*/
	if args.Firstname == "" || args.Lastname == "" || args.Email == "" {
		localError := new(Error)
		localError.s = "Firstname, Lastname and Email are required!"
		return localError
	}
	newId := new(db.User).Add(args)
	msg := fmt.Sprintf("User with name: %s succcessfuly insert with Id: %d in the DB", args.Firstname, newId)
	// Result is already initialized from the function signature
	result.NewId = newId
	result.Msg = msg

	return nil
}

func (e *Error) Error() string {
	return e.s
}

package main

import (
	"fmt"
	"golang_sample/db"
)

type User struct {
	Firstname, Lastname, Email, Micl_uuid, Url string
}

func (u *User) Add(firstname string, lastname string) string {
	localDb := db.GetDb()
	var lastInsertId int
	var err error
	err = localDb.QueryRow("INSERT INTO user (firname, lastname) VALUES($1, $2) returning id;", firstname, lastname).Scan(&lastInsertId)
	db.CheckErr(err)
	returnVal := fmt.Sprintf("success %d", lastInsertId)
	return returnVal
}

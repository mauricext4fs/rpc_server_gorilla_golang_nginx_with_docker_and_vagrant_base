package db

import (
	"fmt"
)

type User struct {
	Firstname, Lastname, Email, Micl_uuid, Url string
}

func (u *User) Add(firstname string, lastname string) string {
	localDb := GetDb()
	var lastInsertId int
	var err error
	err = localDb.QueryRow("INSERT INTO \"user\" (firstname, lastname) VALUES($1, $2) returning id;", firstname, lastname).Scan(&lastInsertId)
	CheckErr(err)
	returnVal := fmt.Sprintf("success %d", lastInsertId)
	return returnVal
}

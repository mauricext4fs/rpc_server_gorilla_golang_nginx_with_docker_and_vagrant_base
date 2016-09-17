package db

import (
	"fmt"
)

type User struct {
	Firstname, Lastname, Email string
}

func (u *User) Add(user *User) string {
	localDb := GetDb()
	var lastInsertId int
	var err error
	err = localDb.QueryRow("INSERT INTO \"user\" (firstname, lastname, email) VALUES($1, $2, $3) returning id;", user.Firstname, user.Lastname, user.Email).Scan(&lastInsertId)
	CheckErr(err)
	returnVal := fmt.Sprintf("success %d", lastInsertId)
	return returnVal
}

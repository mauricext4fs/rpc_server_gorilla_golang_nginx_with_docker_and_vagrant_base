package db

type User struct {
	Firstname, Lastname, Email string
}

func (u *User) Add(user *User) int {
	localDb := GetDb()
	var lastInsertId int
	var err error
	err = localDb.QueryRow("INSERT INTO \"user\" (firstname, lastname, email) VALUES($1, $2, $3) returning id;", user.Firstname, user.Lastname, user.Email).Scan(&lastInsertId)
	CheckErr(err)
	return lastInsertId
}

package db

import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq"
	"sync"
)

var (
	once sync.Once
	db   *sql.DB
)

func initDb() *sql.DB {
	//defer db.Close()
	var err error
	dbinfo := fmt.Sprintf("host=172.17.0.1 port=5433 user=%s password=%s dbname=%s sslmode=disable",
		"postgres", "**7/ClydeAVALON$$", "golang_sample")
	db, err = sql.Open("postgres", dbinfo)
	CheckErr(err)

	return db
}

func GetDb() *sql.DB {
	once.Do(func() { initDb() })
	return db
}

func CheckErr(err error) {
	if err != nil {
		panic(err)
	}
}

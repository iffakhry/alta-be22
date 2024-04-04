package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// Capture connection properties.
	// cfg := mysql.Config{
	// 	User:   "root",
	// 	Passwd: "qwerty",
	// 	Net:    "tcp",
	// 	Addr:   "127.0.0.1:3306",
	// 	DBName: "db_be22",
	// }
	// Get a database handle.
	var db *sql.DB
	var err error
	// db, err = sql.Open("mysql", cfg.FormatDSN())
	// if err != nil {
	// 	log.Fatal(err)
	// }

	// <username>:<password>@tcp(<hostname>:<port-db>)/<db-name>
	db, err = sql.Open("mysql", "root:qwerty123@tcp(127.0.0.1:3306)/db_be22")
	if err != nil {
		log.Fatal(err)
	}

	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	fmt.Println("Berhasil Connect ke DB!")
}

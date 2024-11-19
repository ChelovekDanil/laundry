package database

import "database/sql"

const (
	defDriverName  = "postgres"
	defDataBaseUrl = "host=local user=postgres password=postgres dbname=crud sslmode=disable"
)

// return db connection. Requires connection to be closed
func Connect() (*sql.DB, error) {
	db, err := sql.Open(defDriverName, defDataBaseUrl)
	if err != nil {
		return nil, err
	}
	return db, nil
}

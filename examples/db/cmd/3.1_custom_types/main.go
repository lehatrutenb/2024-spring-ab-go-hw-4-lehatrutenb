package main

import (
	"context"

	"github.com/jackc/pgx/v5"
	log "github.com/sirupsen/logrus"
)

func main() {
	logger := log.New()
	logger.SetLevel(log.InfoLevel)
	logger.SetFormatter(&log.TextFormatter{})

	conn, err := pgx.Connect(context.Background(), "postgres://postgres:postgres@localhost:5432/pg_course")
	if err != nil {
		logger.WithError(err).Fatalf("can't connect to pg")
	}
	defer conn.Close(context.Background())

	co

	user, err := GetUserByID(context.Background(), conn, 1698112)
	if err != nil {
		logger.WithError(err).Fatal("can't exec GetUserByID: %w", err)
	}

	logger.Infof("%+v", user)
}

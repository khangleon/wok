package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"net/http"
	"review/pt"
	"review/src/services/role"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	_ "github.com/lib/pq"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"suntech.com.vn/skylib/skydba.git/skydba"
)

func init() {
	skydba.Init("AppName", "Main Data Source", "postgres", "172.16.22.17", "skyhubv3", "skyhubv3", "skyhubv3", 5434, 5, 10)
}

func main() {
	const GRPC_PORT = 9999
	grpcAddress := fmt.Sprintf("localhost:%v", GRPC_PORT)
	lis, err := net.Listen("tcp", grpcAddress)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()
	pt.RegisterRoleServiceServer(grpcServer, role.DefaultService())
	reflection.Register(grpcServer) // debug mode for evans CLI
	fmt.Printf("GRPC is running on port %v\n", GRPC_PORT)

	go grpcServer.Serve(lis)

	const REST_PORT = 10000
	restAddress := fmt.Sprintf("localhost:%v", REST_PORT)
	mux := runtime.NewServeMux()
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dialOption := []grpc.DialOption{grpc.WithInsecure()}
	if err := pt.RegisterRoleServiceHandlerFromEndpoint(ctx, mux, grpcAddress, dialOption); err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	lis2, err := net.Listen("tcp", restAddress)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	fmt.Printf("Rest is running on port %v\n", REST_PORT)
	http.Serve(lis2, mux)

}

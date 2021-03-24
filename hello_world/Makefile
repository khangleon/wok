run:
	go run src/main/main.go

hot-reload:
	nodemon --exec src/main/main.go
	
gen-go:
	protoc -I. --proto_path=proto --go_out=pt --go-grpc_out=pt \
	--go-grpc_opt=require_unimplemented_servers=false \
	--grpc-gateway_out=:pt --openapiv2_out=:doc \
	proto/role/*.proto google/api/http.proto google/api/annotations.proto

gen-dart:
	protoc protoc -I. --proto_path=proto \
	--dart_out=grpc:../mobile/hello_world/lib/pt  \
	proto/role/*.proto google/api/http.proto google/api/annotations.proto
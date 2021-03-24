///
//  Generated code. Do not modify.
//  source: proto/role/role_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'role_service.pb.dart' as $0;
import 'role_message.pb.dart' as $1;
import '../../google/protobuf/empty.pb.dart' as $2;
export 'role_service.pb.dart';

class RoleServiceClient extends $grpc.Client {
  static final _$findHandler =
      $grpc.ClientMethod<$0.FindRoleRequest, $0.FindRoleResponse>(
          '/role.RoleService/FindHandler',
          ($0.FindRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FindRoleResponse.fromBuffer(value));
  static final _$upsertHandler = $grpc.ClientMethod<$1.Role, $1.Role>(
      '/role.RoleService/UpsertHandler',
      ($1.Role value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Role.fromBuffer(value));
  static final _$deleteHandler =
      $grpc.ClientMethod<$0.DeleteRoleRequest, $2.Empty>(
          '/role.RoleService/DeleteHandler',
          ($0.DeleteRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$getHandler = $grpc.ClientMethod<$0.GetRoleRequest, $1.Role>(
      '/role.RoleService/GetHandler',
      ($0.GetRoleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Role.fromBuffer(value));

  RoleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.FindRoleResponse> findHandler(
      $0.FindRoleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findHandler, request, options: options);
  }

  $grpc.ResponseFuture<$1.Role> upsertHandler($1.Role request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertHandler, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteHandler($0.DeleteRoleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteHandler, request, options: options);
  }

  $grpc.ResponseFuture<$1.Role> getHandler($0.GetRoleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHandler, request, options: options);
  }
}

abstract class RoleServiceBase extends $grpc.Service {
  $core.String get $name => 'role.RoleService';

  RoleServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FindRoleRequest, $0.FindRoleResponse>(
        'FindHandler',
        findHandler_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindRoleRequest.fromBuffer(value),
        ($0.FindRoleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Role, $1.Role>(
        'UpsertHandler',
        upsertHandler_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Role.fromBuffer(value),
        ($1.Role value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteRoleRequest, $2.Empty>(
        'DeleteHandler',
        deleteHandler_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRoleRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRoleRequest, $1.Role>(
        'GetHandler',
        getHandler_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRoleRequest.fromBuffer(value),
        ($1.Role value) => value.writeToBuffer()));
  }

  $async.Future<$0.FindRoleResponse> findHandler_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FindRoleRequest> request) async {
    return findHandler(call, await request);
  }

  $async.Future<$1.Role> upsertHandler_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Role> request) async {
    return upsertHandler(call, await request);
  }

  $async.Future<$2.Empty> deleteHandler_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteRoleRequest> request) async {
    return deleteHandler(call, await request);
  }

  $async.Future<$1.Role> getHandler_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRoleRequest> request) async {
    return getHandler(call, await request);
  }

  $async.Future<$0.FindRoleResponse> findHandler(
      $grpc.ServiceCall call, $0.FindRoleRequest request);
  $async.Future<$1.Role> upsertHandler($grpc.ServiceCall call, $1.Role request);
  $async.Future<$2.Empty> deleteHandler(
      $grpc.ServiceCall call, $0.DeleteRoleRequest request);
  $async.Future<$1.Role> getHandler(
      $grpc.ServiceCall call, $0.GetRoleRequest request);
}

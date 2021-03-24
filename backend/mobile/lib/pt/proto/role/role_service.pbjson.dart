///
//  Generated code. Do not modify.
//  source: proto/role/role_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use findRoleRequestDescriptor instead')
const FindRoleRequest$json = const {
  '1': 'FindRoleRequest',
  '2': const [
    const {'1': 'filter_text', '3': 1, '4': 1, '5': 9, '10': 'filterText'},
  ],
};

/// Descriptor for `FindRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRoleRequestDescriptor = $convert.base64Decode('Cg9GaW5kUm9sZVJlcXVlc3QSHwoLZmlsdGVyX3RleHQYASABKAlSCmZpbHRlclRleHQ=');
@$core.Deprecated('Use findRoleResponseDescriptor instead')
const FindRoleResponse$json = const {
  '1': 'FindRoleResponse',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.role.Role', '10': 'data'},
  ],
};

/// Descriptor for `FindRoleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRoleResponseDescriptor = $convert.base64Decode('ChBGaW5kUm9sZVJlc3BvbnNlEh4KBGRhdGEYASADKAsyCi5yb2xlLlJvbGVSBGRhdGE=');
@$core.Deprecated('Use deleteRoleRequestDescriptor instead')
const DeleteRoleRequest$json = const {
  '1': 'DeleteRoleRequest',
  '2': const [
    const {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 3,
      '8': const {'6': 1},
      '10': 'id',
    },
  ],
};

/// Descriptor for `DeleteRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoleRequestDescriptor = $convert.base64Decode('ChFEZWxldGVSb2xlUmVxdWVzdBISCgJpZBgBIAEoA0ICMAFSAmlk');
@$core.Deprecated('Use getRoleRequestDescriptor instead')
const GetRoleRequest$json = const {
  '1': 'GetRoleRequest',
  '2': const [
    const {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 3,
      '8': const {'6': 1},
      '10': 'id',
    },
  ],
};

/// Descriptor for `GetRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoleRequestDescriptor = $convert.base64Decode('Cg5HZXRSb2xlUmVxdWVzdBISCgJpZBgBIAEoA0ICMAFSAmlk');

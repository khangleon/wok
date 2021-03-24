import 'package:hello_world/pt/proto/role/role_service.pbgrpc.dart';
import 'package:hello_world/util/grpc.dart';

class HomeService {
  Future<FindRoleResponse> find({String filterText}) async {
    final channel = createChannel();
    final client = RoleServiceClient(channel);
    final request = FindRoleRequest(filterText: filterText);
    try {
      return await client.findHandler(request);
    } catch (e) {
      rethrow;
    } finally {
      channel.shutdown();
    }
  }

}
import 'package:grpc/grpc.dart';

ClientChannel createChannel() {
  return ClientChannel("172.16.30.20",
      port: 9999, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
}

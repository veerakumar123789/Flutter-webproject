import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webproject/services/services.dart';

import '../user_model/user_model.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(state).getUser();
});
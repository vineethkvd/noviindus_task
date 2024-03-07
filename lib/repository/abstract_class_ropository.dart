import '../model/user_model.dart';

abstract class ClassRepository {
  Future<UserModel> loginUser(String username, String password);
}

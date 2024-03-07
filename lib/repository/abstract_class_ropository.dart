import '../model/patient_list_model.dart';
import '../model/user_model.dart';

abstract class ClassRepository {
  Future<UserModel> loginUser(String username, String password);
  Future<List<PatientListModel>> getPatients();
}

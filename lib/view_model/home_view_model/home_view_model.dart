import 'package:flutter/material.dart';
import '../../model/patient_list_model.dart';
import '../../repository/api_services.dart';

class HomeViewModel extends ChangeNotifier {
  List<PatientListModel>? _patientListModel;

  String? _error;
  final ApiService _apiService = ApiService();

  String? get error => _error;
  List<PatientListModel>? get patientListModel => _patientListModel;

  Future<void> fetchPatients() async {
    try {
      _patientListModel = await _apiService.getPatients();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load patients: $e';
      notifyListeners();
    }
  }
}

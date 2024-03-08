import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model/home_view_model.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder(
        future: Provider.of<HomeViewModel>(context, listen: false).fetchPatients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load patients.'));
          } else {
            return Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.patientListModel != null) {
                  return ListView.builder(
                    itemCount: viewModel.patientListModel!.length,
                    itemBuilder: (context, index) {
                      final data = viewModel.patientListModel![index];
                      if (data.patient != null) {
                        return ListTile(
                          title: Text("${data.patient![index].name}"),
                          subtitle: Text("${data.patient![index].address}"), // Replace with actual property names
                        );
                      } else {
                        return SizedBox.shrink(); // or some placeholder widget
                      }
                    },
                  );
                } else {
                  return Center(child: Text('No patients found.'));
                }
              },
            );
          }
        },
      ),
    );
  }
}

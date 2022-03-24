import 'package:flutter/material.dart';
import 'package:neuroagent/models/provider_data.dart';
import 'package:neuroagent/screens/add_ritual.dart';
import 'package:neuroagent/widgets/ocdcard.dart';
import 'package:provider/provider.dart';

class OCDTracker extends StatelessWidget {
  const OCDTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:Image(image: AssetImage("assets/images/NeuroAgent.png"),),
        title: Row(
          children: [
            Text("NeuroAgent")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddRitualScreen(),
                padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
              ),
            ),
          );
        },
      ),
      body: SafeArea(child: Consumer<ProviderData>(
        builder: (context, providerData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final ritual = providerData.rituals[index];
              return OCDCard(ritual: ritual);
            },
            itemCount: providerData.ritualsItemCount,
          );
        },
      )),
    );
  }
}

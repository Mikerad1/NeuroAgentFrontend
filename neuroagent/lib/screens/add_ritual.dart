import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/provider_data.dart';

class AddRitualScreen extends StatelessWidget {
  const AddRitualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newRitualTitle = "";
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newRitualTitle = newText;
              },
            ),
            ElevatedButton(
              child: Text("Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Provider.of<ProviderData>(context, listen: false).addRitual(newRitualTitle);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

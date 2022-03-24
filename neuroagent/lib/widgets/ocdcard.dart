import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuroagent/models/provider_data.dart';
import 'package:neuroagent/models/ritual.dart';
import 'package:neuroagent/widgets/rectangle_icon_button.dart';
import 'package:provider/provider.dart';

class OCDCard extends StatelessWidget {

  final Ritual ritual;

  OCDCard({required this.ritual});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(ritual.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangleIconButton(
                icon: Icon(Icons.remove),
                callback: () {},
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Text(ritual.count.toString()),
              SizedBox(
                width: 10,
                height: 10,
              ),
              RectangleIconButton(
                icon: Icon(Icons.add),
                callback: () {
                  Provider.of<ProviderData>(context, listen: false).incrementRitual(ritual.id);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}



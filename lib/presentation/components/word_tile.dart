import 'package:flutter/material.dart';
import '../../data/data_model.dart';
import '../screens/word_details.dart';

class WordTile extends StatelessWidget {
  final Words words;

  WordTile({required this.words});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.amber,child: Text('${words.en![0]}'),),
            title: Text(' ${words.en}'),
            subtitle: Text('${words.bn}'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WordDetailsPage(words: words)));
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}

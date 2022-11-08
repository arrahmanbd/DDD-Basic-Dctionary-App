import 'package:flutter/material.dart';
import '../../data/data_model.dart';
import '../../domain/repository.dart';
import '../components/loading_widget.dart';
import '../components/word_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Words> _words = <Words>[];
  List<Words> _wordsDisplay = <Words>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWords().then((value) {
      setState(() {
        _isLoading = false;
        _words.addAll(value);
        _wordsDisplay = _words;
        print(_wordsDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DDD Dictionary'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isLoading) {
                return index == 0
                    ? _searchBar()
                    : WordTile(words: _wordsDisplay[index - 1]);
              } else {
                return LoadingView();
              }
            },
            itemCount: _wordsDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _wordsDisplay = _words.where((w) {
              var fName = w.en?.toLowerCase();
              var lName = w.bn?.toLowerCase();
              return fName!.contains(searchText) || lName!.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Users',
        ),
      ),
    );
  }
}

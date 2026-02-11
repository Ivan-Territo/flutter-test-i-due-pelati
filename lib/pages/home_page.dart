import 'package:flutter/material.dart';
import '../models/board.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  List<Board> _boards = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBoards();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                itemCount: _boards.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_boards[index].modello),
                    subtitle: Text(_boards[index].marca),
                  );
                },
              ),
            ),
    );
  }

  Future<void> _fetchBoards() async {
    try {
      final response = await _apiService.getBoards();
      setState(() {
        _boards = response;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }
}

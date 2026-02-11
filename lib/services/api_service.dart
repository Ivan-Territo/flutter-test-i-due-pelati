import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/board.dart';

/// Servizio responsabile di tutte le chiamate di rete (HTTP).
/// Utilizza il pacchetto [dio] che è molto potente per gestire le API.
class ApiService {
  // L'URL base è l'indirizzo comune a tutte le nostre chiamate.
  static const String _baseUrl =
      'https://69846b7e885008c00db120c3.mockapi.io/api/v1';

  // Creiamo un'istanza di Dio configurata con il nostro URL base.
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  /// Recupera la lista di tutte le tavole da surf disponibili.
  Future<List<Board>> getBoards() async {
    try {
      final response = await _dio.get('/Exam1');

      if (response.statusCode == 200) {
        // L'API restituisce un array con un oggetto che contiene la chiave "boards"
        final List<dynamic> data = response.data;
        if (data.isNotEmpty && data[0]['boards'] != null) {
          final List<dynamic> boards = data[0]['boards'];
          // Convertiamo ogni ogni Map<String, dynamic> in un oggetto Board 
          return boards.map((json) => Board.fromJson(json)).toList();
        }
        return [];
      }
      return [];
    } catch (e) {
      debugPrint('Errore getBoards: $e');
      return [];
    }
  }
}

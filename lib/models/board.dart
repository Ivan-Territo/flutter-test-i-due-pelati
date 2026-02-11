class Board {
  // TODO: Aggiungi qui le variabili della classe
  // Suggerimento: guarda la struttura JSON nel README.md

  Board({
    required this.id,
    required this.modello,
    required this.marca,
    required this.prezzo,
    required this.lunghezza,
    required this.volume,
    required this.disponibile,
    required this.urlImmagine,
  });

  final int id;
  final String modello;
  final String marca;
  final double prezzo;
  final String lunghezza;
  final String volume;
  final bool disponibile;
  final String urlImmagine;

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      id: json['id'],
      modello: json['modello'],
      marca: json['marca'],
      prezzo: json['prezzo'].toDouble(),
      lunghezza: json['lunghezza'],
      volume: json['volume'],
      disponibile: json['disponibile'],
      urlImmagine: json['url_immagine'],
    );
  }
}

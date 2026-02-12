import 'package:flutter/material.dart';
import '../models/board.dart';
import '../services/api_service.dart';
import 'navigation_page.dart';
import 'hero_section_page.dart';
import 'footer_page.dart';

class HomePage extends StatefulWidget {
  
   HomePage({super.key});

  

  @override
  _HomePageState createState() => _HomePageState();
   
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();
  List<Board> _boards = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBoards();
  }

    @override
  void dispose() {
  _scrollController.dispose();
  super.dispose();
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
              children: [
                NavigationBarCustom(),
                HeroSection(),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'Choose your surfboard',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(
                  child: _boards.isEmpty
                      ? Center(
                          child: Text(
                            'Nessuna board trovata',
                            style: TextStyle(color: Colors.grey.shade600),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _boards.length,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, index) {
                        final board = _boards[index];
                        return Container(
                  
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            color: Theme.of(context).cardColor,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                
                                
                                // Immagine con clipping per angoli arrotondati
                                SizedBox(
                                  height: 150,
                                  child: board.urlImmagine.isNotEmpty
                                      ? Image.network(
                                          board.urlImmagine,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                                child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ));
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey.shade200,
                                              child: const Center(
                                                child: Icon(
                                                  Icons.broken_image,
                                                  size: 48,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(
                                          color: Colors.grey.shade200,
                                          child: const Center(
                                            child: Icon(
                                              Icons.image_not_supported,
                                              size: 48,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        board.modello,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        board.marca,
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        board.prezzo.toStringAsFixed(2) + ' €',
                                        style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Lunghezza: ${board.lunghezza}',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Volume: ${board.volume}',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        board.disponibile
                                            ? 'Disponibile'
                                            : 'Non disponibile',
                                        style: TextStyle(
                                          color: board.disponibile
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ), 

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Freccia sinistra
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset - 250, // distanza scroll
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),

                  const SizedBox(width: 20),

                  // Freccia destra
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset + 250, // distanza scroll
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ],
              ),

SizedBox(height: 24),
                
                Stack(
                    children: [
                      // Sfondo grigio
                      Container(
                       
                      ),

                      // Immagine centrata
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/surf.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Testo sovrapposto
                      const Positioned(
                        bottom: 20, // distanza dal fondo (puoi modificarla)
                        left: 20,   // distanza dal lato sinistro
                        child: Text(
                          "Feel the freedom \nof the sea",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            shadows: [
                              Shadow(
                                blurRadius: 8,
                                color: Colors.black54,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                /*Center(
                  
                  child: Image.asset(
                    'assets/images/surf.jpg',
                    
                    fit: BoxFit.cover,
                  ),
                ),*/ 
                SizedBox(height: 24),
                FooterSection(),

              
                
              ],
          ),
          ),
    );
  }

  Future<void> _fetchBoards() async {
    try {
      final response = await _apiService.getBoards();
      if (!mounted) return;
      setState(() {
        _boards = response;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Errore _fetchBoards: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }
}

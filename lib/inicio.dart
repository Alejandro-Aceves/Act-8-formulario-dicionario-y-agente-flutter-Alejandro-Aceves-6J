import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Tours'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícono grande central para añadir elegancia
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.travel_explore,
                  size: 120,
                  color: Color(0xFF006989),
                ),
              ),
              const SizedBox(height: 50),
              
              // Botón para Capturar Tours
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/captura');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_location_alt, size: 28),
                      SizedBox(width: 15),
                      Text('Capturar Tours', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              
              // Botón para Ver Tours
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ver');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF006989),
                    side: const BorderSide(color: Color(0xFF006989), width: 2),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.list_alt, size: 28),
                      SizedBox(width: 15),
                      Text('Ver Tours', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

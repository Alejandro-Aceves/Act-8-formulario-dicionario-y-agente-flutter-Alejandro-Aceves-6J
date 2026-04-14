import 'package:flutter/material.dart';
import 'diccionario_tour.dart';

class VerToursScreen extends StatelessWidget {
  const VerToursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tours = datosTour.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tours'),
      ),
      body: tours.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 20),
                  const Text(
                    'No hay tours registrados',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15.0),
              itemCount: tours.length,
              itemBuilder: (context, index) {
                final tour = tours[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF006989),
                        radius: 30,
                        child: Text(
                          '#${tour.id}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        tour.ciudad,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF006989),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, size: 18, color: Colors.black87),
                              Text(
                                tour.precio.toStringAsFixed(2),
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text('Categoría: ', style: TextStyle(fontSize: 16)),
                              Row(
                                children: List.generate(
                                  tour.estrellas,
                                  (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

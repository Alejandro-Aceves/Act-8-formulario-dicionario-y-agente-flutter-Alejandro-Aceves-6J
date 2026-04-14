import 'clase_tour.dart';
import 'diccionario_tour.dart';

class GuardarDatosDiccionario {
  // ID autonumérico iniciado en 1
  static int _siguienteId = 1;

  static int get siguienteId => _siguienteId;

  static void guardarTour(String ciudad, double precio, int estrellas) {
    Tour nuevoTour = Tour(
      id: _siguienteId,
      ciudad: ciudad,
      precio: precio,
      estrellas: estrellas,
    );
    
    // Guardar en el diccionario
    datosTour[_siguienteId] = nuevoTour;
    
    // Incrementar el ID autonumérico para el siguiente registro
    _siguienteId++;
  }
}

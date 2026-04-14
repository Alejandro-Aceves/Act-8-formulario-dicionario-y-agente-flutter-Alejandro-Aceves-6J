import 'package:flutter/material.dart';
import 'guardar_datos_diccionario.dart';

class CapturaToursScreen extends StatefulWidget {
  const CapturaToursScreen({super.key});

  @override
  CapturaToursScreenState createState() => CapturaToursScreenState();
}

class CapturaToursScreenState extends State<CapturaToursScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _estrellasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _actualizarId();
  }

  void _actualizarId() {
    _idController.text = GuardarDatosDiccionario.siguienteId.toString();
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      String ciudad = _ciudadController.text;
      double precio = double.parse(_precioController.text);
      int estrellas = int.parse(_estrellasController.text);

      GuardarDatosDiccionario.guardarTour(ciudad, precio, estrellas);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Tour guardado exitosamente'),
            ],
          ),
          backgroundColor: const Color(0xFF006989),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );

      _ciudadController.clear();
      _precioController.clear();
      _estrellasController.clear();
      setState(() {
        _actualizarId();
      });
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _ciudadController.dispose();
    _precioController.dispose();
    _estrellasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Nuevo Tour'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Datos del Tour',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF006989),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Campo 1: ID (Autonumérico)
                    TextFormField(
                      controller: _idController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'ID del Tour (Autonumérico)',
                        prefixIcon: const Icon(Icons.tag, color: Color(0xFF006989)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo 2: Ciudad
                    TextFormField(
                      controller: _ciudadController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Ciudad Destino',
                        prefixIcon: const Icon(Icons.location_city, color: Color(0xFF006989)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF006989), width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa la ciudad';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Campo 3: Precio
                    TextFormField(
                      controller: _precioController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Precio del Tour',
                        prefixIcon: const Icon(Icons.attach_money, color: Color(0xFF006989)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF006989), width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa el precio';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingresa un número válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Campo 4: Estrellas
                    TextFormField(
                      controller: _estrellasController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Categoría en Estrellas (1-5)',
                        prefixIcon: const Icon(Icons.star_rate, color: Color(0xFF006989)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF006989), width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa las estrellas';
                        }
                        int? estrellas = int.tryParse(value);
                        if (estrellas == null || estrellas < 1 || estrellas > 5) {
                          return 'Debe ser un número del 1 al 5';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: _guardar,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text('Guardar Datos', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

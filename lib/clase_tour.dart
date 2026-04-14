class Tour {
  int id;
  String ciudad;
  double precio;
  int estrellas;

  Tour({
    required this.id,
    required this.ciudad,
    required this.precio,
    required this.estrellas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ciudad': ciudad,
      'precio': precio,
      'estrellas': estrellas,
    };
  }
}

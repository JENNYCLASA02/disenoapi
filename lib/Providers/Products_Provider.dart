import 'package:http/http.dart' as http;

Future<void> ModelosProducts() async {
  final resp = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (resp.statusCode == 200) {
    print('Respuesta exitosa: ${resp.body}');
  } else {
    print('Error en la solicitud ${resp.statusCode}');
  }
}

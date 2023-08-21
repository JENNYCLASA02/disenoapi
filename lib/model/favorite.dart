import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Tienda.dart';

class Favorite {
  final List<Tienda> list;
  final String user;

  Favorite(this.list, this.user);

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((tienda) => tiendaToJson(tienda)).toList(),
      'user': user,
    };
  }

  factory Favorite.fromJson(Map<String, dynamic> json) {
    final List<dynamic> TiendaList = json['list'];
    final List<Tienda> tiendas = TiendaList.map((json) => Tienda(
          json['image'],
          json['name'],
          json['location'],
          json['rating'],
          json['age'],
          json['description'],
        )).toList();
    final String user = json['user'];
    return Favorite(tiendas, user);
  }

  Map<String, dynamic> tiendaToJson(Tienda tienda) {
    return {
      'image': tienda.image,
      'name': tienda.name,
      'location': tienda.location,
      'rating': tienda.rating,
      'age': tienda.age,
      'description': tienda.description,
    };
  }

  Tienda tiendaFromJson(Map<String, dynamic> json) {
    return Tienda(
      json['image'],
      json['name'],
      json['location'],
      json['rating'],
      json['age'],
      json['description'],
    );
  }

  Future<void> saveFavoriteTiendas(Tienda tienda, String user) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJson = prefs.getString('favorites');
    if (favoriteJson != null) {
      final Map<String, dynamic> favoriteMap = json.decode(favoriteJson);
      final Map<String, dynamic> updatedFavoriteMap =
          Map<String, dynamic>.from(favoriteMap);
      if (updatedFavoriteMap.containsKey(user)) {
        final List<dynamic> tiendalList = updatedFavoriteMap[user]['list'];
        final List<Tienda> existingTiendas = tiendalList
            .map((json) => tiendaFromJson(json))
            .toList()
            .cast<Tienda>();

        if (existingTiendas
            .any((existingTiendas) => existingTiendas.name == tienda.name)) {
          return;
        }
        tiendalList.add(tiendaToJson(tienda));
      } else {
        updatedFavoriteMap[user] = {
          'list': [tiendaToJson(tienda)],
        };
      }
      await prefs.setString('favorites', json.encode(updatedFavoriteMap));
    } else {
      final favorite = {
        user: {
          'list': [tiendaToJson(tienda)],
        },
      };
      await prefs.setString('favorites', json.encode(favorite));
    }
  }

  Future<List<Tienda>> loadFavoriteTiendas(String user) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJson = prefs.getString('favorites');
    if (favoriteJson != null) {
      final Map<String, dynamic> favoriteMap = json.decode(favoriteJson);
      if (favoriteMap.containsKey(user)) {
        final List<dynamic> tiendaList = favoriteMap[user]['list'];
        final List<Tienda> tienda = tiendaList
            .map((json) => tiendaFromJson(json))
            .toList()
            .cast<Tienda>();
        return tienda;
      }
    }
    return [];
  }

  Future<void> removeFavoriteTienda(Tienda tienda, String user) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJson = prefs.getString('favorites');
    if (favoriteJson != null) {
      final Map<String, dynamic> favoriteMap = json.decode(favoriteJson);
      if (favoriteMap.containsKey(user)) {
        final List<dynamic> animalList = favoriteMap[user]['list'];
        final List<Tienda> animals = animalList
            .map((json) => tiendaFromJson(json))
            .toList()
            .cast<Tienda>();

        // Filtrar la lista para eliminar el animal correspondiente
        final updatedAnimals =
            animals.where((a) => a.name != tienda.name).toList();

        // Actualizar el mapa de favoritos con la nueva lista
        favoriteMap[user]['list'] =
            updatedAnimals.map((a) => tiendaToJson(a)).toList();

        await prefs.setString('favorites', json.encode(favoriteMap));
      }
    }
  }
}

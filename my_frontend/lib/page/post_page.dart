import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../functions/get_image_urls.dart';
import '../functions/parse_pokedex.dart';
import '../models/pokemon_model.dart';

class GetPage extends StatelessWidget {
  final Dio dio = Dio();
  GetPage({super.key});

  Future<Map<String, dynamic>> getRequest() async {
    final response = await dio.get('http://127.0.0.1:8001/pokedex/api/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Page'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
            future: getRequest(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                Map<String, dynamic> data = snapshot.data!;
                List<Pokemon> pokemons = parsePokedox(data);

                return ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    String imagePath = getImageUrl(pokemons[index].id);
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Text(pokemons.elementAt(index).id.toString()),
                        title: Text(
                          pokemons.elementAt(index).name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          
                        ),
                        subtitle: Text(
                          pokemons.elementAt(index).type,

                         ),
                         trailing: Image.asset(imagePath, width: 40,),
                      ),
                    );
                  },
                );
              }

              return Container(
                child: const Center(child: Text('No data found')),
              );
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:assignment/models/products.dart';
import 'package:assignment/services/remote_services..dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product>? products;
  var isLoaded = false;

  @override
  initState() {
    super.initState();

    // Fetch data from API
    getData();
  }

  getData() async {
    products = (await RemoteService().getProducts()) as List<Product>?;
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: products?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              child: Text(products![index].title),
            );
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

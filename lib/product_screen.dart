

import 'package:blocapicall/productsbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}


class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
   context.read<ProductsblocBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Screen"),
        ),
        body: BlocBuilder<ProductsblocBloc, ProductsblocState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ProductsLoadedState) {
              return ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {

                return ListTile(
                  title: Text(state.productsmodel[index].title.toString()),
                  leading: Text(state.productsmodel[index].category.toString()),
                  trailing: Image.network(state.productsmodel[index].image.toString()),

                );
              });
            } else if (state is ProductsErrorState) {
              return Center(child: Text(state.errorMessege),);
            }
            return SizedBox();
          }
            ));
            }
}


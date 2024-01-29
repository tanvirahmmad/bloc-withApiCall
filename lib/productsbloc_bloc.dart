import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'models/products_model.dart';

part 'productsbloc_event.dart';
part 'productsbloc_state.dart';

class ProductsblocBloc extends Bloc<ProductsLoadedEvent, ProductsblocState> {
  ProductsblocBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async{
      try{
emit(ProductsLoadingState());
var response =await http.get(Uri.parse("https://fakestoreapi.com/products"));
if(response.statusCode==200) {
  emit(ProductsLoadedState(productsmodel: productsFromJson(response.body)));
}else{
  throw Exception("Failed To Load Products");
}
      }catch(e){
emit(ProductsErrorState(e.toString()));

      }

    });
  }
}

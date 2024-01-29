part of 'productsbloc_bloc.dart';

abstract class ProductsblocState extends Equatable {
  const ProductsblocState();
  @override
  List<Object> get props => [];
}

class ProductsblocInitial extends ProductsblocState {}

class ProductsLoadingState extends ProductsblocState {}

class ProductsLoadedState extends ProductsblocState {
  final List<Products> productsmodel;

  ProductsLoadedState({required this.productsmodel});
  @override
  List<Object> get props => [productsmodel];
}

class ProductsErrorState extends ProductsblocState {
  final String errorMessege;

  ProductsErrorState(this.errorMessege);
  @override
  List<Object> get props => [errorMessege];

}

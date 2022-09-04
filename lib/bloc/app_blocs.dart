import 'package:flutter_application_2/bloc/app_events.dart';
import 'package:flutter_application_2/bloc/app_states.dart';
import 'package:flutter_application_2/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(ProductAdding());
      await Future.delayed(const Duration(
          seconds: 1)); // Skip, this case is for server emitation
      try {
        await productRepository.create(name: event.name, price: event.price);
        emit(ProductAdded());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}

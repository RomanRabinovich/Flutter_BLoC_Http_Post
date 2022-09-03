import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductState extends Equatable {}

class InitialState extends ProductState {
  @override
  //todo: implement props
  List<Object?> get props => [];
}

class ProductAdding extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductAdded extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  List<Object?> get props => [error];
}
